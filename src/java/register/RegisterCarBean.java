package register;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import java.util.regex.*;

public class RegisterCarBean extends org.apache.struts.action.ActionForm {
    
    private String userId;
    private String email;
    private String from;
    private String destination;
    private int seatsAvailable;
    private int charge;
    private String contact;
    

    public String getDestination() {
        return destination;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }

    public int getSeatsAvailable() {
        return seatsAvailable;
    }

    public void setSeatsAvailable(int seatsAvailable) {
        this.seatsAvailable = seatsAvailable;
    }

    public int getCharge() {
        return charge;
    }

    public void setCharge(int charge) {
        this.charge = charge;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFrom() {
        return from;
    }

    public void setFrom(String from) {
        this.from = from;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public RegisterCarBean() {
        super();
    }

    public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
        ActionErrors errors = new ActionErrors();
        if (userId == null || getUserId().length() < 1) {
            errors.add("userId", new ActionMessage("error.userid.required"));
        }
        if (email == null || getEmail().length() < 1) {
            errors.add("email", new ActionMessage("error.email.required"));
        }
        if (from == null || getFrom().length() < 1) {
            errors.add("from", new ActionMessage("error.from.required"));
        }
        if (destination == null || getDestination().length() < 1) {
            errors.add("destination", new ActionMessage("error.destination.required"));
        }
        if (getSeatsAvailable() < 1) {
            errors.add("seatsAvailable", new ActionMessage("error.seats.invalid"));
        }
        if (getCharge()< 0) {
            errors.add("charge", new ActionMessage("error.charge.invalid"));
        }
        if (getContact().length()< 10 || getContact().length()> 10 ||contact==null) {
            errors.add("contact", new ActionMessage("error.contact.invalid"));
        }
        if(!Pattern.matches("\\w+([-+.']\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*", email) && !email.equals("") )
                errors.add("email", new ActionMessage("error.email.invalid"));
        
        
        return errors;
    }
}
