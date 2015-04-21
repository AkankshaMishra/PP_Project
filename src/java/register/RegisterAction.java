package register;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.*;

public class RegisterAction extends org.apache.struts.action.Action {

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        //Any Complex Validation
        RegisterBean bean = (RegisterBean)form;
        String userId = bean.getUserId();
        ActionErrors errors = new ActionErrors();
        if(!errors.isEmpty()){
            saveErrors(request, errors);
            
            return mapping.getInputForward();
        }
            
        //Perform any business Logic
        //System.out.println(bean.getComplaintType());        
        return mapping.findForward("success");
        //return mapping.findForward("failure");
    }
}
