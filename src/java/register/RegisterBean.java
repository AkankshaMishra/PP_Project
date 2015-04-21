package register;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import java.util.regex.*;

public class RegisterBean extends org.apache.struts.action.ActionForm {
    
    private String userId;
    private String email;
    private String subject;
    private String message;
    private String since;
    private String complaintType;

    public String getComplaintType() {
        return complaintType;
    }

    public void setComplaintType(String complaintType) {
        this.complaintType = complaintType;
    }

    public String getSince() {
        return since;
    }

    public void setSince(String since) {
        this.since = since;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }


    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }


    public RegisterBean() {
        super();
        // TODO Auto-generated constructor stub
    }

    public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
        ActionErrors errors = new ActionErrors();
        if (userId == null || getUserId().length() < 1) {
            errors.add("userId", new ActionMessage("error.userid.required"));
        }
        if (email == null || getEmail().length() < 1) {
            errors.add("email", new ActionMessage("error.email.required"));
        }
        
        if (subject == null || getSubject().length() < 1) {
            errors.add("subject", new ActionMessage("error.subject.required"));
        }
         if (message == null || getMessage().length() < 30) {
            errors.add("message", new ActionMessage("error.message.required"));
        }
         if (since == null || getSince().length() < 1) {
            errors.add("since", new ActionMessage("error.since.required"));
        }
       
        if(!Pattern.matches("\\w+([-+.']\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*", email) && !email.equals("") )
                errors.add("email", new ActionMessage("error.email.invalid"));
        
        
        return errors;
    }
}
