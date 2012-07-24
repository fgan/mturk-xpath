
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package qual;

import java.io.IOException;
import java.io.FileInputStream;
/*
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
*/

//import org.apache.commons.lang.StringUtils;
//import com.amazonaws.mturk.requester.Assignment;
//import com.amazonaws.mturk.requester.AssignmentStatus;
//import com.amazonaws.mturk.requester.GetReviewableHITsResult;
//import com.amazonaws.mturk.requester.GetReviewableHITsSortProperty;
import com.amazonaws.mturk.requester.HIT;
import com.amazonaws.mturk.requester.QualificationType;
import com.amazonaws.mturk.requester.QualificationTypeStatus;
//import com.amazonaws.mturk.requester.ReviewableHITStatus;
//import com.amazonaws.mturk.requester.SearchHITsResult;
//import com.amazonaws.mturk.requester.SearchHITsSortProperty;
//import com.amazonaws.mturk.requester.SortDirection;
import com.amazonaws.mturk.service.axis.RequesterService;
import com.amazonaws.mturk.util.PropertiesClientConfig;
//import edu.berkeley.cs.crowddb.s3.S3Service;

/**
 *
 * @author work
 */
public class MakeQual {
    private RequesterService reqservice;

    public MakeQual() throws IOException {
	// set up mechanical turk service.
	reqservice = new RequesterService(new PropertiesClientConfig(
									"../mturk.properties"));
	
    }
    
    public void createQual() {
	
	String name = "Google Scraper Qualification.";
	String keywords = "Chrome, Scraper, XPath.";
	String description = "Use the Scraper tool to find the XPath of a table.";
	Long retryDelay = new Long(60 * 60); // 1 hour
	Long duration = new Long(60 * 30); // 30 minutes
	Boolean autoGrant = true;
	//	QualificationTypeStatus qts = "Invalid";
	Integer autoGrantVal = 1;
	String test = getQuestionXML("question.xml");
	String answerKey = getQuestionXML("answer.xml");
	
	try {
	    // TODO: consider using createHITAsync and do it in batch.
	    QualificationType qual = reqservice.createQualificationType(name, keywords, description, null, retryDelay, test, answerKey, duration, autoGrant, autoGrantVal);

	    System.out.println("Created Qualification.");
	} catch (Exception e) {
	    System.err.println(e.getLocalizedMessage());
	}
    }

    private static String getQuestionXML(String filepath) {
	String result = "";
	try {
	    FileInputStream file = new FileInputStream(filepath);
	    byte[] b = new byte[file.available()];
	    file.read(b);
	    file.close();
	    result = new String(b);
	    
	} catch (Exception ex) {
	    System.out.println(ex.toString());
	}
	
	return result;
    }

   public static void main(String[] args) throws IOException {
       MakeQual test = new MakeQual();
       test.createQual();
   }
}
