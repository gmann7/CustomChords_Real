package model;

import java.util.Date;

public class Ordine {
	
	public Ordine() {
		this.id = 0;
		this.data = null;
		this.stato = null;
		this.commenti = null;
		this.email = null;
		this.cittaSpedizione = null;
		this.indirizzoSpedizione = null;
		this.numerocarta = null;
	}

	public Ordine(int id, Date data, String stato, String commenti, String email, String cittaSpedizione,
			String indirizzoSpedizione, String numerocarta) {
		this.id = id;
		this.data = data;
		this.stato = stato;
		this.commenti = commenti;
		this.email = email;
		this.cittaSpedizione = cittaSpedizione;
		this.indirizzoSpedizione = indirizzoSpedizione;
		this.numerocarta = numerocarta;
	}
	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getData() {
		return data;
	}

	public void setData(Date data) {
		this.data = data;
	}

	public String getStato() {
		return stato;
	}

	public void setStato(String stato) {
		this.stato = stato;
	}

	public String getCommenti() {
		return commenti;
	}

	public void setCommenti(String commenti) {
		this.commenti = commenti;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCittaSpedizione() {
		return cittaSpedizione;
	}

	public void setCittaSpedizione(String cittaSpedizione) {
		this.cittaSpedizione = cittaSpedizione;
	}

	public String getIndirizzoSpedizione() {
		return indirizzoSpedizione;
	}

	public void setIndirizzoSpedizione(String indirizzoSpedizione) {
		this.indirizzoSpedizione = indirizzoSpedizione;
	}

	public String getNumerocarta() {
		return numerocarta;
	}

	public void setNumerocarta(String numerocarta) {
		this.numerocarta = numerocarta;
	}

	@Override
	public String toString() {
		return "Ordine [id=" + id + ", data=" + data + ", stato=" + stato + ", commenti=" + commenti + ", email="
				+ email + ", cittaSpedizione=" + cittaSpedizione + ", indirizzoSpedizione=" + indirizzoSpedizione
				+ ", numerocarta=" + numerocarta + "]\n";
	}

	

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Ordine other = (Ordine) obj;
		if (cittaSpedizione == null) {
			if (other.cittaSpedizione != null)
				return false;
		} else if (!cittaSpedizione.equals(other.cittaSpedizione))
			return false;
		if (commenti == null) {
			if (other.commenti != null)
				return false;
		} else if (!commenti.equals(other.commenti))
			return false;
		if (data == null) {
			if (other.data != null)
				return false;
		} else if (!data.equals(other.data))
			return false;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (id != other.id)
			return false;
		if (indirizzoSpedizione == null) {
			if (other.indirizzoSpedizione != null)
				return false;
		} else if (!indirizzoSpedizione.equals(other.indirizzoSpedizione))
			return false;
		if (numerocarta == null) {
			if (other.numerocarta != null)
				return false;
		} else if (!numerocarta.equals(other.numerocarta))
			return false;
		if (stato == null) {
			if (other.stato != null)
				return false;
		} else if (!stato.equals(other.stato))
			return false;
		return true;
	}





	int id;
	Date data;
	String stato;
	String commenti;
	String email;
	String cittaSpedizione;
	String indirizzoSpedizione;
	String numerocarta;
}
