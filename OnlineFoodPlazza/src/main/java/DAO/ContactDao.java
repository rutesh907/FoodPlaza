package DAO;

import java.util.List;
import POJO.ContactUs;

public interface ContactDao {
	boolean addreview(ContactUs c);
	boolean deletereview(int srno);
	List<ContactUs> ShowReview();
}
