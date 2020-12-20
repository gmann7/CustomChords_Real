import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.ArrayList;


import model.*;
import model.Utente.Sesso;

public class Tester {
	public static void main(String[] args) throws Exception {
		Prodotto p1 = new Prodotto("a", "mario", "bello", "uomo", "umano", 2, 14, false);
		Prodotto p2 = new Prodotto("o", "mario", "bello", "uomo", "umano", 2, 14, false);
		Prodotto p3 = new Prodotto("b", "luca", "bello", "uomo", "umano", 2, 14, false);

		System.out.println(p1.toString());
		System.out.println(p2.toString());
		System.out.println(p1.equals(p2));
		System.out.println("--------------------");

		ItemCarrello i1 = new ItemCarrello(p1, 1);
		ItemCarrello i2 = new ItemCarrello(p2, 1);
		ItemCarrello i3 = new ItemCarrello(p3, 3);

		System.out.println(i1.toString());
		System.out.println(i2.toString());
		System.out.println(i3.toString());
		System.out.println(i1.equals(i2));

		System.out.println("--------------------------------");

		// TEST addItem === ok
		Carrello cart1 = new Carrello();
		cart1.addItem(p1);
		cart1.addItem(p2);
		cart1.addItem(p3);
		cart1.addItem(p1);
		cart1.addItem(p2, 3);
		cart1.decreaseItem(p2);
		System.out.println(cart1);

		// TEST removeItem === ok
		cart1.removeItem(p2);
		System.out.println(cart1);

		// TEST changeAmont
		cart1.changeAmount(p3, 7);
		System.out.println(cart1);

		// TEST clearCart
		cart1.cleanCart();
		System.out.println(cart1);
		
		System.out.println("+---------------NUOVA PROVA CARRELLO--------------------");
		cart1.addItem(p1);
		System.out.println(cart1);
		cart1.decreaseItem(p1);
		System.out.println(cart1);
		

		

		System.out
				.println("-------------------------------PROVA CONNECTION POOL--------------------------------------");
		Connection con = null;

		
		  System.out.println("--------------------PROVA DOSAVE----------------"); try  {
		  con = DriverManagerConnectionPool.getConnection(); ProductModel pm = new
		  ProductModel();
		  
		  pm.doSave(new Prodotto("pppp", "renry", "comodo ed ergonomica", "chitarra",
		 "classica", 7, 20, false)); }catch(Exception e) { System.out.print("ops"); }
		 

		
		System.out.println("------------PROVA DELETE---------------");
		try {
			
			ProductModel pm = new ProductModel();

			pm.doDelete("pppp");

		} catch (Exception e) {
			System.out.print("ops2");
		}

		System.out.println("----------------PROVA LOGIN-----------------)");
		try {
			ClienteModel cm = new ClienteModel();
			Boolean b = cm.checkLogin("jfdklfj@ffjal.it", "mannini");
			System.out.println(b);
		} catch (Exception e) {
			System.out.println("errore");
		}

		System.out.println("----------------PROVA SEARCH--------------(FUNZIONANTE)");
		try {
			ProductModel pm = new ProductModel();
			ArrayList<Prodotto> list = pm.doSearch("chitarra","classica");
			if (list.size() > 0) {
				System.out.println(list);
			}
		} catch (Exception e) {
			System.out.println("Errore search");
		}
		
		System.out.println("----------------PROVA RESEARCH-------------(FUNZIONANTE)");
		try {
			ProductModel pm = new ProductModel();
			ArrayList<Prodotto> list = pm.doResearch("o");
			if (list.size() > 0) {
				System.out.println(list);
			}
		} catch (Exception e) {
			System.out.println("Errore search");
		}
		
		System.out.println("--------------PROVA UTENTE-------------------(FUNZIONANTE)");
		Utente u1 = new Utente();
		Utente u2 = new Utente("stella", "barba", new SimpleDateFormat("yyyy-mm-dd").parse("1970-03-20") , Sesso.F, "stellaba@gmail.com", "76656666", "via santa croce", "positano","Italia", false);
		Utente u3=null;
		System.out.println(u1);
		
		try {
			ClienteModel cm = new ClienteModel();
			 u3 = cm.doRetrieveByKey("pm@yahoo.it");
			 cm.doSave(u2,"StellaBarba.20");
		} catch (Exception e) {
			System.out.println("Errore ricerca utente");
			System.out.println(e.getMessage());
		}
		System.out.println(u2);
		System.out.println(u3);

		
		
		System.out.println("---------------PROVA CHECKEMAIL-------------");
		try {
			ClienteModel cm = new ClienteModel();
			System.out.println(cm.checkEmail("pm@yahoo.it"));
			System.out.println(cm.checkEmail("pf@yahoo.it"));
			System.out.println(cm.checkEmail("pm@yfdafahoo.it"));
			System.out.println(cm.checkEmail("prrrrm@yahoo.it"));
		} catch (Exception e) {
			System.out.println("Errore checkemail utente");
			System.out.println(e.getMessage());
		}


	/*	System.out.println("-------------------PROVA ISPRESENT------------");
		try {
			ProductModel pm = new ProductModel();
			System.out.println(pm.isPresent("a34c"));
			System.out.println(pm.isPresent("fl67"));
			System.out.println(pm.isPresent("o9o9"));
			System.out.println(pm.isPresent("bbbb"));


			
		}catch(Exception e) {
			e.printStackTrace();
		}*/
		
		
		
		System.out.println("-------------------PROVA VETRINA---------------");
		try {
			
		
		ProductModel pm = new ProductModel();
		ArrayList<Prodotto> list = pm.doRetrieveVetrina();
		System.out.println(list);
		}
		
		catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		
	}

}
