package com.helper;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

//it is singleton class so that it provide factory object and Fclose object

public class FactoryProvider 
{
	public static SessionFactory sf;
	
	public static SessionFactory getFactory()
	{
		if(sf==null)
		{
			sf=new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
		}
		return sf;
	}
	
	public void closeFactory()
	{
		if(sf.isOpen())
		{
			sf.close();
		}
	}

}
