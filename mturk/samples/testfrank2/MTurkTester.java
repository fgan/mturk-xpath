/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package testfrank2;

import java.io.IOException;
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
public class MTurkTester {
    private RequesterService reqservice;
    //private S3Service s3service;

       private int numAssignments = 5;
       private double reward = 0.03;
       private long assignmentDurationInSeconds = 60 * 60; // 5 mins
       private long autoApprovalDelayInSeconds = 60 * 60 * 24 * 3; // 3 days
       private long lifetimeInSeconds = 60 * 60 * 24; // 1 day

   public MTurkTester(double reward) throws IOException {
      // set up mechanical turk service.
      reqservice = new RequesterService(new PropertiesClientConfig(
            "../mturk.properties"));

      this.reward = reward;
      //s3service = new S3Service();
   }

   public void createHit() {

       String title = "Find information about UC Berkeley professors.";
       String description = "Please find information about UC Berkeley professors.";
       String hitType = reqservice.registerHITType(autoApprovalDelayInSeconds,
            assignmentDurationInSeconds, reward, title, null, description,
            null);

      String url = "http://ec2-50-18-19-3.us-west-1.compute.amazonaws.com:8080/sandbox/strictInput/InputData.jsp";

      String question = "<?xml version=\"1.0\"?>\n"
         + "<ExternalQuestion xmlns=\"http://mechanicalturk.amazonaws.com/AWSMechanicalTurkDataSchemas/2006-07-14/ExternalQuestion.xsd\">\n"
         + "  <ExternalURL>" + url + "</ExternalURL>\n"
         + "  <FrameHeight>400</FrameHeight>\n"
         + "</ExternalQuestion>";
      System.out.println("Posting : " + question);
      try {
         // TODO: consider using createHITAsync and do it in batch.
         HIT hit = reqservice.createHIT(hitType, null, null, null, question, null,
               null, null, lifetimeInSeconds, numAssignments,
               null, null, null);

         System.out.println("Created HIT: " + hit.getHITId());
         System.out.println(reqservice.getWebsiteURL() + "/mturk/preview?groupId=" + hit.getHITTypeId());
         System.out.println(url);

      } catch (Exception e) {
         System.err.println(e.getLocalizedMessage());
      }
   }

   public static void main(String[] args) throws IOException {
       MTurkTester test = new MTurkTester(0.03);
       test.createHit();
   }
}
