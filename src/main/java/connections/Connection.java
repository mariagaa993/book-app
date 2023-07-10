package connections;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class Connection {
    private static final String PERSISTENCE_UNIT_NAME = "persistenceBookApp";
    private static EntityManagerFactory entityManagerFactory;

    public static EntityManager getEntityManager() {
        if(entityManagerFactory == null) {
            entityManagerFactory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT_NAME);
        }
        return entityManagerFactory.createEntityManager();
    }

    public static void closeEntityManagerFactory() {
        if(entityManagerFactory != null) {
            entityManagerFactory.close();
        }
    }
}
