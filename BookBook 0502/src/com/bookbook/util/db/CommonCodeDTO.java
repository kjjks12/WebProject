package com.bookbook.util.db;

public class CommonCodeDTO {
	private String commonCode;
	private String name;
	private String desc;
	private String parentCode;
	private String regDate;
	private String updateDate;
	private String used;
	

	public CommonCodeDTO() {
		super();
	}

	public CommonCodeDTO(String commonCode, String name, String parentCode) {
		super();
		this.commonCode = commonCode;
		this.name = name;
		this.parentCode = parentCode;
	}

	public CommonCodeDTO(String common_code, String name, String desc, String parentCode, String regDate,
			String updateDate, String used) {
		super();
		this.commonCode = common_code;
		this.name = name;
		this.desc = desc;
		this.parentCode = parentCode;
		this.regDate = regDate;
		this.updateDate = updateDate;
		this.used = used;
	}

	public String getCommonCode() {
		return commonCode;
	}

	public void setCommonCode(String common_code) {
		this.commonCode = common_code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public String getParentCode() {
		return parentCode;
	}

	public void setParentCode(String parentCode) {
		this.parentCode = parentCode;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}

	public String getUsed() {
		return used;
	}

	public void setUsed(String used) {
		this.used = used;
	}

	@Override
	public String toString() {
		return "CommonCodeDTO [common_code=" + commonCode + ", name=" + name + ", desc=" + desc + ", parentCode="
				+ parentCode + ", regDate=" + regDate + ", updateDate=" + updateDate + ", used=" + used + "]";
	}

}
