package entity;

import java.io.Serializable;
import java.sql.Date;
import org.apache.solr.client.solrj.beans.Field;
public class Book implements Serializable {
		/**
		 * 
		 */
		private static final long serialVersionUID = 1L;
		@Field
		private String id;
		@Field
		private int booktype;
		@Field
		private String name;
		@Field
		private String author;
		@Field
		private String press;
		@Field
		private double price;
		@Field
		private int amount;
		@Field
		private String pic;
		private int number;//be used when calculating total price.
		
		public Book()
		{
			number=1;
		}
		public Book(String id,String name,double price){
			this.id=id;
			this.name=name;
			this.price=price;
			number=1;
		}
		public Book(String id,int booktype, String name, String author, String press,  double price, int amount,String pic)
		{
			System.out.println("Book!");
			this.id = id;
			this.booktype=booktype;
			this.name = name;
			this.author = author;
			this.press = press;
			this.price = price;
			this.amount = amount;
			this.pic=pic;
			number=1;
		}
		
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		public int getBooktype() {
			return booktype;
		}
		public void setBookType(int booktype) {
			this.booktype = booktype;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getAuthor() {
			return author;
		}
		public void setAuthor(String author) {
			this.author = author;
		}
		public String getPress() {
			return press;
		}
		public void setPress(String press) {
			this.press = press;
		}
		public double getPrice() {
			return price;
		}
		public void setPrice(double price) {
			this.price = price;
		}
		public int getAmount() {
			return amount;
		}
		public void setAmount(int amount) {
			this.amount = amount;
		}
		public String getPic() {
			return pic;
		}
		public void setPic(String pic) {
			this.pic = pic;
		}
		public static long getSerialversionuid() {
			return serialVersionUID;
		}

		public int getNumber() {
			return number;
		}
		public void setNumber(int number) {
			this.number = number;
		}
		@Override
		public String toString()
		{
			StringBuffer buffer = new StringBuffer();
			
			buffer.append(this.id + ",");
			buffer.append(this.booktype + ",");
			buffer.append(this.name + ",");
			buffer.append(this.author + ",");
			buffer.append(this.press + ",");
			buffer.append(this.price + ",");
			buffer.append(this.amount);
			buffer.append(this.pic);
			
			return buffer.toString();
		}
		
		


}
