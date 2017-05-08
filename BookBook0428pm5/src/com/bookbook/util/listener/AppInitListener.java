package com.bookbook.util.listener;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.ResourceBundle;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import com.bookbook.util.action.Action;
import com.bookbook.util.db.CodeUtil;
import com.bookbook.util.db.CommonCodeDTO;
import com.bookbook.util.db.DBUtil;

/**
 * Application Lifecycle Listener implementation class ActionMappingListener
 *
 */
@WebListener
public class AppInitListener implements ServletContextListener {
	public void contextDestroyed(ServletContextEvent arg0) {

	}

	public void contextInitialized(ServletContextEvent e) {
		/**
		 * ActionMapping
		 */
		ServletContext application = e.getServletContext();
		String fileName = application.getInitParameter("fileName");
		ResourceBundle rb = ResourceBundle.getBundle(fileName);
		Map<String, Action> map = new HashMap<String, Action>();

		for (String key : rb.keySet()) {
			String value = rb.getString(key);
			// System.out.println(key + " : " + value);

			Action action = null;
			try {
				action = (Action) Class.forName(value).newInstance();
			} catch (InstantiationException | IllegalAccessException | ClassNotFoundException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			map.put(key, action);
		}
		application.setAttribute("actionMap", map);

		/*
		 * String uri = request.getScheme() + "://" + // "http" + "://
		 * request.getServerName() + // "myhost" ":" + // ":"
		 * request.getServerPort() + // "8080" request.getRequestURI() + //
		 * "/people" "?" + // "?" request.getQueryString(); //
		 * "lastname=Fox&age=30"
		 * 
		 * 
		 * String docURL = "http://" + application.getContextPath(); // http://
		 * String docRoot = application.getRealPath("/") + "/"; //
		 * 
		 * System.out.println(docURL + " " + docRoot);
		 * application.setAttribute("", docURL);
		 */
		Map<String, CommonCodeDTO> codeMap = new HashMap<>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			String sql = "select commonCode_common_code common_code, commonCode_name code_name, commonCode_parent_code parent_code from commonCode";
			con = DBUtil.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				codeMap.put(rs.getString("common_code"), new CommonCodeDTO(rs.getString("common_code"),
						rs.getString("code_name"), rs.getString("parent_code")));
			}

			application.setAttribute("codeMap", codeMap);

			new CodeUtil(application);
		} catch (SQLException e1) {
			System.out.println("공통코드 읽기 실패");
		} finally {
			DBUtil.dbClose(con, ps, rs);
		}

	}
}
