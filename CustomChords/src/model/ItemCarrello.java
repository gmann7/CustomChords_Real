package model;

public class ItemCarrello {
	public ItemCarrello() {
	}
	
	public ItemCarrello(Prodotto item) {
		this.item=item;
		this.quantita=1;
	}

	public ItemCarrello(Prodotto item, int quantita) {
		this.item = item;
		this.quantita = quantita;
	}

	public Prodotto getItem() {
		return item;
	}

	public void setItem(Prodotto item) {
		this.item = item;
	}

	public int getQuantita() {
		return quantita;
	}

	public void setQuantita(int quantita) {
		this.quantita = quantita;
	}

	public void increaseItem() {
		this.quantita++;
	}

	public void decreaseItem() {
		this.quantita--;
	}

	@Override
	public String toString() {
		return "ItemCarrello [item=" + item + ", quantita=" + quantita + "]";
	}

	@Override
	public boolean equals(Object otherObject) {
		if (!(otherObject instanceof ItemCarrello))
			return false;
		ItemCarrello i = (ItemCarrello) otherObject;
		return this.item.equals(i.item) && this.quantita == i.getQuantita();
	}

	Prodotto item;
	int quantita;
}
