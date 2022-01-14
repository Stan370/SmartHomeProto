package jspservlet.vo;

public class Measure_data {

	private double temperature;
	private double humidity;
	private int brightness;
	private boolean door;
	private boolean windows;
	private boolean buzzer;
	private boolean theft;
	private boolean vibration_sensor;
	private boolean human_infrared;

	public double getTemperature() {
		return temperature;
	}

	public void setTemperature(double temperature) {
		this.temperature = temperature;
	}

	public double getHumidity() {
		return humidity;
	}

	public void setHumidity(double humidity) {
		this.humidity = humidity;
	}

	public int getBrightness() {
		return brightness;
	}

	public void setBrightness(int brightness) {
		this.brightness = brightness;
	}

	public boolean getDoor() {
		return door;
	}

	public void setDoor(boolean door) {
		this.door = door;
	}

	public boolean getWindows() {
		return windows;
	}

	public void setWindows(boolean windows) {
		this.windows = windows;
	}

	public boolean getBuzzer() {
		return buzzer;
	}

	public void setBuzzer(boolean buzzer) {
		this.buzzer = buzzer;
	}

	public boolean getTheft() {
		return theft;
	}

	public void setTheft(boolean theft) {
		this.theft = theft;
	}

	public boolean getVibration_sensor() {
		return vibration_sensor;
	}

	public void setVibration_sensor(boolean vibration_sensor) {
		this.vibration_sensor = vibration_sensor;
	}

	public boolean getHuman_infrared() {
		return human_infrared;
	}

	public void setHuman_infrared(boolean human_infrared) {
		this.human_infrared = human_infrared;
	}

	@Override
	public String toString() {
		return "Measure_data [temperature=" + temperature + ", humidity=" + humidity + ", brightness=" + brightness
				+ ", door=" + door + ", windows=" + windows + ", buzzer=" + buzzer + ", theft=" + theft
				+ ", vibration_sensor=" + vibration_sensor + ", human_infrared=" + human_infrared + "]";
	}

}
