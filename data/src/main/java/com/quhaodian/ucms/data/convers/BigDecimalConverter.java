package com.quhaodian.ucms.data.convers;

import java.math.BigDecimal;

import org.apache.commons.beanutils.Converter;

public class BigDecimalConverter implements Converter {

	@Override
	public <T> T convert(Class<T> type, Object value) {
		if (value == null) {
			return null;
		}
		if (type.getName().equals(BigDecimal.class.getName())) {

			BigDecimal resullt = null;
			if (value instanceof Number) {
				resullt = new BigDecimal(value.toString());
				return (T) resullt;
			}

		}
		return null;
	}

}
