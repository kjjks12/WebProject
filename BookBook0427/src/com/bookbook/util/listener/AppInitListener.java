package com.bookbook.util.listener;

import java.util.HashMap;
import java.util.Map;
import java.util.ResourceBundle;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import com.bookbook.util.action.Action;

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


		/*String uri = request.getScheme() + "://" + // "http" + "://
				request.getServerName() + // "myhost"
				":" + // ":"
				request.getServerPort() + // "8080"
				request.getRequestURI() + // "/people"
				"?" + // "?"
				request.getQueryString(); // "lastname=Fox&age=30"
		
		
		String docURL = "http://" + application.getContextPath(); // http://
		String docRoot = application.getRealPath("/") + "/"; //

		System.out.println(docURL + " " + docRoot);
		application.setAttribute("", docURL);*/
	}
}
