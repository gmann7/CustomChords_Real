package model;

import java.util.ArrayList;
import java.util.Iterator;

public class Carrello {

	public Carrello() {
		this.cart = new ArrayList<ItemCarrello>();
		this.totItem = 0;
		this.totPrezzo = 0;
	}

	public ArrayList<ItemCarrello> getCart() {
		return cart;
	}

	public void setCart(ArrayList<ItemCarrello> cart) {
		this.cart = cart;
	}

	/*
	 * adds the product to the cart just if it not contains yet,otherwise it
	 * increases the quantity
	 * 
	 * @param p the the product to add
	 */
	public void addItem(Prodotto p) {
		if (this.containsItem(p)) {
			for (ItemCarrello i : cart) {
				if (i.getItem().equals(p)) {
					i.increaseItem();
				}
			}

		} else {
			cart.add(new ItemCarrello(p, 1));
		}
		totItem++;
		totPrezzo += p.getPrezzo();
	}

	/*
	 * adds to cart the product p for qnt times
	 * 
	 * @param p the the product to add
	 * 
	 * @param qnt the quantity of the item we want to add
	 */
	public void addItem(Prodotto p, int qnt) {
		int i;
		for (i = 0; i < qnt; i++) {
			this.addItem(p);
		}

	}

	/*
	 * Remove the product p and decrease the price and the amount of the item in the
	 * cart
	 * 
	 * @param p the product we want to remove
	 * 
	 * 
	 */
	public void decreaseItem(Prodotto p) {
		if (this.containsItem(p)) {
			for (ItemCarrello i : cart) {
				if (i.getItem().equals(p)) {
					i.decreaseItem();
				}

			}
			this.fixQuantity();
		} else {
			return;
		}
		totItem--;
		totPrezzo -= p.getPrezzo();
	}
	
	public void removeItem(Prodotto p) {
		if (this.containsItem(p)) {
			for (ItemCarrello i : cart) {
				if (i.getItem().equals(p)) {
					i.setQuantita(0);
				}
			}
			this.fixQuantity();
			this.fixPriceAndAmount();
		} 
	}

	public void changeAmount(Prodotto p, int qnt) {
		if (!(this.containsItem(p)))
			return;
		for (ItemCarrello i : cart) {
			if (i.getItem().equals(p)) {
				i.setQuantita(qnt);
			}
		}
		this.fixQuantity();
		this.fixPriceAndAmount();
	}

	/*
	 * used to control the total amount of the item and the totale price for the
	 * cart, and fix it
	 * 
	 */
	private void fixPriceAndAmount() {
		int totI = 0;
		double totP = 0;
		for (ItemCarrello i : cart) {
			totI += i.quantita;
			totP += (i.quantita * i.getItem().getPrezzo());
		}
		this.totItem = totI;
		this.totPrezzo = totP;
	}

	private void fixQuantity() {
		Iterator<ItemCarrello> i = cart.iterator();
		while (i.hasNext()) {
			ItemCarrello item = i.next();
			if (item.getQuantita() == 0) {
				i.remove();
			}
		}
	}

	// @return true if the cart contains the item, false otherwise
	public boolean containsItem(Prodotto p) {
		for (ItemCarrello i : cart) {
			if (i.getItem().getId().equals(p.getId())) {
				return true;
			}
		}
		return false;
	}

	public void cleanCart() {
		cart.clear();
		this.totItem = 0;
		this.totPrezzo = 0;
	}

	public int getTotItem() {
		return totItem;
	}

	public double getTotPrezzo() {
		return totPrezzo;
	}

	@Override
	public String toString() {
		return "Carrello [cart=" + cart + ", totItem=" + totItem + ", totPrezzo=" + totPrezzo + "]";
	}

	ArrayList<ItemCarrello> cart;
	int totItem;
	double totPrezzo;

}
