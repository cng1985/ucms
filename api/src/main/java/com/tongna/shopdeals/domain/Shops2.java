package com.tongna.shopdeals.domain;

public class Shops2 {
	/**
	 * shop_id    商户id 
       longitude
       latitude   
       distance   当前距离与商户之间的距离，没有传递longitude，latitude字段会 返回-1
       shop_url   pc端商户详情页
       shop_murl  wap端商户详情页
	 */
	
	private int shop_id;
	private float longitude;
	private float latitude;
	private float distance;
	private String shop_url;
	private String shop_murl;
	public int getShop_id() {
		return shop_id;
	}
	public void setShop_id(int shop_id) {
		this.shop_id = shop_id;
	}
	public float getLongitude() {
		return longitude;
	}
	public void setLongitude(float longitude) {
		this.longitude = longitude;
	}
	public float getLatitude() {
		return latitude;
	}
	public void setLatitude(float latitude) {
		this.latitude = latitude;
	}
	public float getDistance() {
		return distance;
	}
	public void setDistance(float distance) {
		this.distance = distance;
	}
	public String getShop_url() {
		return shop_url;
	}
	public void setShop_url(String shop_url) {
		this.shop_url = shop_url;
	}
	public String getShop_murl() {
		return shop_murl;
	}
	public void setShop_murl(String shop_murl) {
		this.shop_murl = shop_murl;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + Float.floatToIntBits(distance);
		result = prime * result + Float.floatToIntBits(latitude);
		result = prime * result + Float.floatToIntBits(longitude);
		result = prime * result + shop_id;
		result = prime * result + ((shop_murl == null) ? 0 : shop_murl.hashCode());
		result = prime * result + ((shop_url == null) ? 0 : shop_url.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Shops2 other = (Shops2) obj;
		if (Float.floatToIntBits(distance) != Float.floatToIntBits(other.distance))
			return false;
		if (Float.floatToIntBits(latitude) != Float.floatToIntBits(other.latitude))
			return false;
		if (Float.floatToIntBits(longitude) != Float.floatToIntBits(other.longitude))
			return false;
		if (shop_id != other.shop_id)
			return false;
		if (shop_murl == null) {
			if (other.shop_murl != null)
				return false;
		} else if (!shop_murl.equals(other.shop_murl))
			return false;
		if (shop_url == null) {
			if (other.shop_url != null)
				return false;
		} else if (!shop_url.equals(other.shop_url))
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "Shops2 [shop_id=" + shop_id + ", longitude=" + longitude + ", latitude=" + latitude + ", distance="
				+ distance + ", shop_url=" + shop_url + ", shop_murl=" + shop_murl + "]";
	}
	
}
