package service;

import dao.AdministratorDao;
import domain.Administrator;

public class AdministratorService{
	private AdministratorDao administratorDao = new AdministratorDao();

	public Boolean registerAdministrator(Administrator administrator) {
		if (administratorDao.find(administrator.getUsername(),administrator.getPassword())==null) {
			administratorDao.add(administrator);
			return true;
		}
		else
			return false;
	}

	public Administrator loginAdministrator(String username, String password) {
		return administratorDao.find(username, password);
	}
}
