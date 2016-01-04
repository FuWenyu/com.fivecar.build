package com.infohold.cms.basic.common;

import java.io.Serializable;
import java.util.Comparator;

@SuppressWarnings("rawtypes")
public class Label implements Comparable, Serializable {

	private static final long serialVersionUID = 3689355407466181430L;

	private String name;
	private String value;

	public static final Comparator CASE_INSENSITIVE_ORDER = new Comparator() {
		public int compare(Object o1, Object o2) {
			String name1 = ((Label) o1).getName();
			String name2 = ((Label) o2).getName();
			return name1.compareToIgnoreCase(name2);
		}
	};

	public Label() {
		super();
	}

	public Label(final String name, final String value) {
		this.name = name;
		this.value = value;
	}


	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getValue() {
		return this.value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public int compareTo(Object o) {
		String otherName = ((Label) o).getName();
		return this.getName().compareTo(otherName);
	}

	public String toString() {
		/*StringBuffer sb = new StringBuffer("LabelValue[");
		sb.append(this.label);
		sb.append(", ");
		sb.append(this.value);
		sb.append("]");
		return (sb.toString());*/
		return this.name+":"+this.value;
	}

	public boolean equals(Object obj) {
		if (obj == this) {
			return true;
		}

		if (!(obj instanceof Label)) {
			return false;
		}

		Label bean = (Label) obj;
		int nil = (this.getValue() == null) ? 1 : 0;
		nil += (bean.getValue() == null) ? 1 : 0;

		if (nil == 2) {
			return true;
		} else if (nil == 1) {
			return false;
		} else {
			return this.getValue().equals(bean.getValue());
		}

	}

	public int hashCode() {
		return (this.getValue() == null) ? 17 : this.getValue().hashCode();
	}
}
