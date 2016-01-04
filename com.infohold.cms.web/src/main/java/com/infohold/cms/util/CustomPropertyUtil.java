package com.infohold.cms.util;

import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Properties;

import org.springframework.beans.factory.config.ConfigurableListableBeanFactory;
import org.springframework.beans.factory.config.PropertyPlaceholderConfigurer;
import org.springframework.util.PropertyPlaceholderHelper;

public class CustomPropertyUtil extends PropertyPlaceholderConfigurer {
	private static Map<String, String> properties = new HashMap<String, String>();

	protected void processProperties(
			ConfigurableListableBeanFactory beanFactoryToProcess,
			Properties props) {
		// PropertyPlaceholderHelper helper = new PropertyPlaceholderHelper(
		// DEFAULT_PLACEHOLDER_PREFIX, DEFAULT_PLACEHOLDER_SUFFIX,
		// DEFAULT_VALUE_SEPARATOR, true);

		for (Entry<Object, Object> entry : props.entrySet()) {
			String key = (String) entry.getKey();
			String value = (String) entry.getValue();
			// value = helper.replacePlaceholders(value, props);
			properties.put(key, value);
		}
	}

	public static Map<String, String> getProperties() {
		return properties;
	}

	public static String getProperties(String key) {
		return properties.get(key);
	}
}
