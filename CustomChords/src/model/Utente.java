package model;

import java.util.Date;

public class Utente {
	
	public Utente() {
		this.nome = null;
		this.cognome = null;
		this.datanascita = null;
		this.sesso = null;
		this.email = null;
		this.telefono = null;
		this.indirizzo = null;
		this.citta = null;
		this.nazione = null;
		this.admin = null;
	}

	public Utente(String nome, String cognome, Date datanascita, Sesso sesso, String email,
			String telefono, String indirizzo, String citta, String nazione, Boolean i) throws Exception{
		this.nome = nome;
		this.cognome = cognome;
		this.datanascita = datanascita;
		this.sesso = sesso;
		this.email = email;
		this.telefono = telefono;
		this.indirizzo = indirizzo;
		this.citta = citta;
		this.nazione = nazione;
		this.admin = i;
	}



	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getCognome() {
		return cognome;
	}

	public void setCognome(String cognome) {
		this.cognome = cognome;
	}

	public Date getDatanascita() {
		return datanascita;
	}

	public void setDatanascita(Date datanascita) {
		this.datanascita = datanascita;
	}

	public Sesso getSesso() {
		return sesso;
	}

	public void setSesso(Sesso sesso) {
		this.sesso = sesso;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public String getIndirizzo() {
		return indirizzo;
	}

	public void setIndirizzo(String indirizzo) {
		this.indirizzo = indirizzo;
	}

	public String getCitta() {
		return citta;
	}

	public void setCitta(String citta) {
		this.citta = citta;
	}

	public String getNazione() {
		return nazione;
	}

	public void setNazione(String nazione) {
		this.nazione = nazione;
	}

	public Boolean getAdmin() {
		return admin;
	}

	public void setAdmin(Boolean admin) {
		this.admin = admin;
	}
	
	@Override
	public String toString() {
		return "Utente [nome=" + nome + ", cognome=" + cognome + ", datanascita=" + datanascita
				+ ", sesso=" + sesso + ", email=" + email  + ", telefono=" + telefono
				+ ", indirizzo=" + indirizzo + ", citta=" + citta + ", nazione=" + nazione + ", admin=" + admin + "]";
	}

	 public enum Sesso {
		M, F
	}

	String nome;
	String cognome;
	Date datanascita;
	Sesso sesso;
	String email;
	String telefono;
	String indirizzo;
	String citta;
	String nazione;
	Boolean admin;
	

}
