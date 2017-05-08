package com.bookbook.book.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookbook.util.action.Action;

public class PagingAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			int pageno = Integer.parseInt(request.getParameter("pageno"));
			if (pageno < 1) {// ���� ������
				pageno = 1;
			}

			int total_record = 754; // �� ���ڵ� ��
			int page_per_record_cnt = 5; // ������ �� ���ڵ� ��
			int group_per_page_cnt = 5; // ������ �� ������ ��ȣ ��[1],[2],[3],[4],[5]
			// [6],[7],[8],[9],[10]

			int record_end_no = pageno * page_per_record_cnt;
			int record_start_no = record_end_no - (page_per_record_cnt - 1);
			if (record_end_no > total_record) {
				record_end_no = total_record;
			}

			int total_page = total_record / page_per_record_cnt + (total_record % page_per_record_cnt > 0 ? 1 : 0);
			if (pageno > total_page) {
				pageno = total_page;
			}

			// ���� ������(����) / �������� �� ������ ���� ��ȣ ��(����) + (�׷� ��ȣ�� ���� ������(����) % �������� ��
			// ������
			// ���� ��ȣ ��(����)>0 ? 1 : 0)
			int group_no = pageno / group_per_page_cnt + (pageno % group_per_page_cnt > 0 ? 1 : 0);
			// ���� �׷��ȣ = ���������� / �������� ������ ��ȣ�� (���� ������ % �������� ������ ��ȣ �� >0 ? 1:0)
			// ex) 14 = 13(��) = (66 / 5) 1 (1(������) =66 % 5)

			int page_eno = group_no * group_per_page_cnt;
			// ���� �׷� �� ��ȣ = ���� �׷��ȣ * �������� ������ ��ȣ
			// ex) 70 = 14 * 5
			int page_sno = page_eno - (group_per_page_cnt - 1);
			// ���� �׷� ���� ��ȣ = ���� �׷� �� ��ȣ - (�������� ������ ��ȣ �� -1)
			// ex) 66 = 70 - 4 (5 -1)

			if (page_eno > total_page) {
				// ���� �׷� �� ��ȣ�� ��ü������ �� ���� Ŭ ���
				page_eno = total_page;
				// ���� �׷� �� ��ȣ�� = ��ü������ ���� ����
			}

			int prev_pageno = page_sno - group_per_page_cnt; // << *[����]*
																// [21],[22],[23]...
																// [30] [����] >>
			// ���� ������ ��ȣ = ���� �׷� ���� ��ȣ - �������� ������ ��ȣ��
			// ex) 46 = 51 - 5
			int next_pageno = page_sno + group_per_page_cnt; // << [����]
																// [21],[22],[23]...
																// [30] *[����]*
																// >>
			// ���� ������ ��ȣ = ���� �׷� ���� ��ȣ + �������� ������ ��ȣ��
			// ex) 56 = 51 - 5
			if (prev_pageno < 1) {
				// ���� ������ ��ȣ�� 1���� ���� ���
				prev_pageno = 1;
				// ���� �������� 1��
			}
			if (next_pageno > total_page) {
				// ���� ���������� ��ü������ ������ Ŭ���
				next_pageno = total_page / group_per_page_cnt * group_per_page_cnt + 1;
				// next_pageno=total_page
				// ���� ������ = ��ü�������� / �������� ������ ��ȣ�� * �������� ������ ��ȣ�� + 1
				// ex) = 76 / 5 * 5 + 1 ????????
			}
		} catch (Exception e) {

		}
	}
}