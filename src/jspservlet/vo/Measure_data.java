package jspservlet.vo;

import java.io.Serializable;

public class Measure_data implements Serializable {
	private static final long serialVersionUID = 1L;
	private String measure_time;
	private Double temperature;
	private Double humidity;
	private Integer brightness;
	private Boolean door;
	private Boolean windows;
	private String Buzzer;
	private Boolean switch_status;
	private Boolean Vibration_sensor;
	private Boolean Human_infrared;
	private Integer Sunshade_angle;
	private Integer led;
	private String hardware_equipment_e_id;

	public String getMeasure_time() {
		return measure_time;
	}

	public void setMeasure_time(String measure_time) {
		this.measure_time = measure_time;
	}

	public Double getTemperature() {
		return temperature;
	}

	public void setTemperature(Double temperature) {
		this.temperature = temperature;
	}

	public Double getHumidity() {
		return humidity;
	}

	public void setHumidity(Double humidity) {
		this.humidity = humidity;
	}

	public Integer getBrightness() {
		return brightness;
	}

	public void setBrightness(Integer brightness) {
		this.brightness = brightness;
	}

	public Boolean getDoor() {
		return door;
	}

	public void setDoor(Boolean door) {
		this.door = door;
	}

	public Boolean getWindows() {
		return windows;
	}

	public void setWindows(Boolean windows) {
		this.windows = windows;
	}

	public String getBuzzer() {
		return Buzzer;
	}

	public void setBuzzer(String buzzer) {
		Buzzer = buzzer;
	}

	public Boolean getSwitch_status() {
		return switch_status;
	}

	public void setSwitch_status(Boolean switch_status) {
		this.switch_status = switch_status;
	}

	public Boolean getVibration_sensor() {
		return Vibration_sensor;
	}

	public void setVibration_sensor(Boolean vibration_sensor) {
		Vibration_sensor = vibration_sensor;
	}

	public Boolean getHuman_infrared() {
		return Human_infrared;
	}

	public void setHuman_infrared(Boolean human_infrared) {
		Human_infrared = human_infrared;
	}

	public Integer getSunshade_angle() {
		return Sunshade_angle;
	}

	public void setSunshade_angle(Integer sunshade_angle) {
		Sunshade_angle = sunshade_angle;
	}

	public Integer getLed() {
		return led;
	}

	public void setLed(Integer led) {
		this.led = led;
	}

	public String getHardware_equipment_e_id() {
		return hardware_equipment_e_id;
	}

	public void setHardware_equipment_e_id(String hardware_equipment_e_id) {
		this.hardware_equipment_e_id = hardware_equipment_e_id;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "/" + measure_time + "/" + temperature + "/" + humidity + "/" + brightness + "/" + door + "/" + windows + "/" + Buzzer
				+ "/" + switch_status + "/" + Vibration_sensor + "/" + Human_infrared + "/" + Sunshade_angle + "/" + led + "/"
				+ hardware_equipment_e_id + "/";
	}
}