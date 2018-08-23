package util;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;

public class HibernateUtil {

	private static SessionFactory factory;

	static {
		AnnotationConfiguration configuration = new AnnotationConfiguration();
		configuration.configure();
		factory = configuration.buildSessionFactory();
	}

	public static Session getSession() {
		return factory.openSession();
	}
}
