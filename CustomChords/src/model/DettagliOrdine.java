package model;

public class DettagliOrdine {
	
	public DettagliOrdine() {
		super();
		
	}
	
	
	public DettagliOrdine(int idOrdine, String idProdotto, int quantita, double prezzo, double iva) {
		super();
		this.idOrdine = idOrdine;
		this.idProdotto = idProdotto;
		this.quantita = quantita;
		this.prezzo = prezzo;
		this.iva = iva;
	}


	public int getIdOrdine() {
		return idOrdine;
	}


	public void setIdOrdine(int idOrdine) {
		this.idOrdine = idOrdine;
	}


	public String getIdProdotto() {
		return idProdotto;
	}


	public void setIdProdotto(String idProdotto) {
		this.idProdotto = idProdotto;
	}


	public int getQuantita() {
		return quantita;
	}


	public void setQuantita(int quantita) {
		this.quantita = quantita;
	}


	public double getPrezzo() {
		return prezzo;
	}


	public void setPrezzo(double prezzo) {
		this.prezzo = prezzo;
	}


	public double getIva() {
		return iva;
	}


	public void setIva(double iva) {
		this.iva = iva;
	}



	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		DettagliOrdine other = (DettagliOrdine) obj;
		if (idOrdine != other.idOrdine)
			return false;
		if (idProdotto == null) {
			if (other.idProdotto != null)
				return false;
		} else if (!idProdotto.equals(other.idProdotto))
			return false;
		if (Double.doubleToLongBits(iva) != Double.doubleToLongBits(other.iva))
			return false;
		if (Double.doubleToLongBits(prezzo) != Double.doubleToLongBits(other.prezzo))
			return false;
		if (quantita != other.quantita)
			return false;
		return true;
	}


	@Override
	public String toString() {
		return "DettagliOrdine [idOrdine=" + idOrdine + ", idProdotto=" + idProdotto + ", quantita=" + quantita
				+ ", prezzo=" + prezzo + ", iva=" + iva + "]\n";
	}


	int idOrdine;
	String idProdotto;
	int quantita;
	double prezzo;
	double iva;

}
