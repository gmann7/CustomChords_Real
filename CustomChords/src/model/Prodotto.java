package model;

public class Prodotto {
	public Prodotto() {
		this.id = "";
		this.nome = "";
		this.descrizione = "";
		this.categoria = "";
		this.sottoCategoria = "";
		this.quantitaDisponibile = 0;
		this.prezzo = 0;
		this.vetrina = false;
		this.iva = 0;
	}

	public Prodotto(String id, String nome, String descrizione, String categoria, String sottoCategoria,
			int quantitaDisponibile, double prezzo, boolean vetrina,double iva) {
		this.id = id;
		this.nome = nome;
		this.descrizione = descrizione;
		this.categoria = categoria;
		this.sottoCategoria = sottoCategoria;
		this.quantitaDisponibile = quantitaDisponibile;
		this.prezzo = prezzo;
		this.vetrina = vetrina;
		this.iva = iva;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getDescrizione() {
		return descrizione;
	}

	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}

	public String getCategoria() {
		return categoria;
	}

	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}

	public String getSottoCategoria() {
		return sottoCategoria;
	}

	public void setSottoCategoria(String sottoCategoria) {
		this.sottoCategoria = sottoCategoria;
	}

	public int getQuantitaDisponibile() {
		return quantitaDisponibile;
	}

	public void setQuantitaDisponibile(int quantitaDisponibile) {
		this.quantitaDisponibile = quantitaDisponibile;
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

	public boolean isVetrina() {
		return vetrina;
	}

	public void setVetrina(boolean vetrina) {
		this.vetrina = vetrina;
	}

	@Override
	public String toString() {
		return "Prodotto [id=" + id + ", nome=" + nome + ", descrizione=" + descrizione + ", categoria=" + categoria
				+ ", sottoCategoria=" + sottoCategoria + ", quantitaDisponibile=" + quantitaDisponibile + ", prezzo="
				+ prezzo + ", vetrina=" + vetrina +"iva= " + iva + "]\n";
	}

	@Override
	public boolean equals(Object otherObject) {
		if (!(otherObject instanceof Prodotto))
			return false;
		Prodotto p = (Prodotto) otherObject;
		return this.id.equalsIgnoreCase(p.getId()) && this.nome.equalsIgnoreCase(p.getNome())
				&& this.descrizione.equalsIgnoreCase(p.getDescrizione())
				&& this.categoria.equalsIgnoreCase(p.getCategoria())
				&& this.sottoCategoria.equalsIgnoreCase(p.getSottoCategoria())
				&& this.quantitaDisponibile == p.getQuantitaDisponibile() && this.prezzo == p.getPrezzo();
	}

	String id;
	String nome;
	String descrizione;
	String categoria;
	String sottoCategoria;
	int quantitaDisponibile;
	double prezzo;
	boolean vetrina;
	double iva;
}
