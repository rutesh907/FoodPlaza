package POJO;

public class ContactUs
{
private int SrNo;
private String CustName;   
private String CustEmail;
private String CustPhoneNo; 
private String Messages;


public ContactUs(int srNo, String custName, String custEmail, String custPhoneNo, String messages) {
	super();
	SrNo = srNo;
	CustName = custName;
	CustEmail = custEmail;
	CustPhoneNo = custPhoneNo;
	Messages = messages;
}

public int getSrNo() {
	return SrNo;
}
public void setSrNo(int srNo) {
	SrNo = srNo;
}

public String getCustName() {
	return CustName;
}
public void setCustName(String custName) {
	CustName = custName;
}
public String getCustEmail() {
	return CustEmail;
}
public void setCustEmail(String custEmail) {
	CustEmail = custEmail;
}
public String getCustPhoneNo() {
	return CustPhoneNo;
}
public void setCustPhoneNo(String custPhoneNo) {
	CustPhoneNo = custPhoneNo;
}
public String getMessages() {
	return Messages;
}
public void setMessages(String messages) {
	Messages = messages;
}

@Override
public String toString() {
	return "ContactUs [SrNo=" + SrNo + ", CustName=" + CustName + ", CustEmail=" + CustEmail + ", CustPhoneNo="
			+ CustPhoneNo + ", Messages=" + Messages + "]";
}
public ContactUs() {
	super();
	// TODO Auto-generated constructor stub
}
	

}
