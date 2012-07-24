<%@page import="java.util.*"%>
<%@page import="java.io.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.net.*"%>

<%

String workerID = request.getParameter("workerId");
String assignmentID = request.getParameter("assignmentId");
if (workerID == null) {
    workerID = "";
}

if(request.getParameter("formValue") != null) {
    String queryFragment = "assignmentId=" + assignmentID;
    queryFragment += "&path=" + request.getParameter("formValue");
    URI uri = new URI("http", "www.mturk.com", "/mturk/externalSubmit", queryFragment, null);
    URL url = uri.toURL();
    response.sendRedirect(url.toString());
    //out.write(url.toString());
}
%>

<html>
<head>
    <title>Qualification Test</title>
    <link href="css/qual.css" type="text/css" rel="stylesheet" />
    <link href="css/jquery-ui-1.8.16.custom.css" type="text/css" rel="stylesheet" />

    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/jquery-ui-1.8.16.custom.min.js"></script>
    <script type="text/javascript">
        var workerID = "<%=workerID%>";
    </script>
    <script type="text/javascript" src="js/qual.js"></script>
</head>
<body>
    <div id="google" class="wrapper content">
        This HIT should be completed on the Google Chrome browser.
        You can download the Google Chrome browser at <a class="link" href="www.google.com/chrome">this link</a>, then access this HIT using Chrome to complete it.
    </div>
    <div id="preview" class="wrapper content">
    	This HIT requires you to use the Google Chrome Browser. You will need to install a plugin called the "Scraper", and use it to find information for the HIT.
    </div>
    <div id="mainContent" class="wrapper content">
        <div id="TOC">
            <a id="toc1" href="">1. Install the Scraper extension</a><br />
            <a id="toc2" href="">2. Using the scraper</a><br />
            <a id="toc3" href="">3. Qualification test</a>
        </div>
        <div id="install" class="qual container">
            This HIT should be completed using the Google Chrome Scraper extension, found <a
            href="https://chrome.google.com/webstore/detail/mbigbapnjcgaffohmbkdlecaccepngjd?hc=search&hcp=main" onclick="window.open('https://chrome.google.com/webstore/detail/mbigbapnjcgaffohmbkdlecaccepngjd?hc=search&hcp=main', 'Scraper'); return false;">
            here</a>.
            <h1>1. Installing the Scraper extension</h1>
            <p>
                Go to the <a class="link" href="https://chrome.google.com/webstore/detail/mbigbapnjcgaffohmbkdlecaccepngjd?hc=search&hcp=main">
                    scraper installation page</a>. Install the Scraper extension by clicking on
                the 'Add to Chrome' button, then clicking 'Install'.</p>
            <img id="install1" src="img/install2-1.png" alt="Adding scraper to Chrome" />
            <p>
                If the installation is successful, or if you already have the extension installed,
                the button should instead say "Added to Chrome".</p>
            <img id="install2" src="img/install3.png" alt="scraper added!" />
            <p>
                Now that you've installed the Scraper, <a href="" onclick="$('#toc2').click();return false;">learn how to use it</a>!
            </p>
        </div>
        <div id="use" class="qual container">
            <h1>2. Using the scraper</h1>
            <p>
                The example below uses the following table:
            </p>
            <table id="months">
                <tbody>
                    <tr>
                        <th>Chronology</th>
                        <th>Alphabetic</th>
                        <th>Days</th>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>January</td>
                        <td>31</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>February</td>
                        <td>28</td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>March</td>
                        <td>31</td>
                    </tr>
                    <tr>
                        <td>4</td>
                        <td>April</td>
                        <td>30</td>
                    </tr>
                    <tr>
                        <td>5</td>
                        <td>May</td>
                        <td>31</td>
                    </tr>
                    <tr>
                        <td>6</td>
                        <td>June</td>
                        <td>30</td>
                    </tr>
                    <tr>
                        <td>7</td>
                        <td>July</td>
                        <td>31</td>
                    </tr>
                    <tr>
                        <td>8</td>
                        <td>August</td>
                        <td>31</td>
                    </tr>
                    <tr>
                        <td>9</td>
                        <td>September</td>
                        <td>30</td>
                    </tr>
                    <tr>
                        <td>10</td>
                        <td>October</td>
                        <td>31</td>
                    </tr>
                    <tr>
                        <td>11</td>
                        <td>November</td>
                        <td>30</td>
                    </tr>
                    <tr>
                        <td>12</td>
                        <td>December</td>
                        <td>31</td>
                    </tr>
                </tbody>
            </table>
            <p> 
                Highlight some portion of the table. Make sure the highlighted portion includes at least two cells.
            </p>
            <img id="use1" src="img/use1.png" alt="Highlight some part of the table" />
            <p>
                Right click and select "scraper similar..."
            </p>
            <img id="use2" src="img/use2.png" alt="Select 'scrape similar...'" />
            <p>
                A Scraper window pops up with the data you scraped. The XPath is highlighted in
                the top left.
            </p>
            <img id="use3" src="img/use3.png" alt="Look for the XPath" />
            <p>
                Now that you know how to use the Scraper, <a href="" onclick="$('#toc3').click();return false;">take the qualification test</a>.
            </p>
        </div>
        <div id="test" class="qual container">
            <h1>3. Qualification test</h1>
            <div>
                Qualification - Input the XPath of the table on <a class="link" href="test.html" onclick="window.open('test.html', 'test'); return false;">this page</a>:
                <input type="text" id="testVal"/><br />
            </div>
	    <button id="submitTest" onclick="window.qualControl.validate();" />submit test</button>
            <span id="testError" class="error"></span>
            <p>
                <a href="" onclick="$('#toc2').click();return false;">Go back to review the instructions</a>.
            </p>
        </div>
    </div>
    <div id="HIT" class="hit wrapper content">
    	<div class="hit container">
	    <h1>Task</h1>
	    Use the Scraper plugin to find the XPath of the page indicated. Instructions for how to use the Scraper can be found <a id="qualLink">here</a>
	    <form id="theForm" name="theForm" action="qualification.jsp" method="POST">
	     	Input the XPATH for the list found at <a id="hitLink" class="link">this link</a><br />
    		<input type="text" id="formValue" name="formValue" />
		<br />
		<button id="sendHIT">Submit HIT</button>
		<input type="submit" id="submitHIT" style="display:none" name="submitHIT" value="Submit HIT">
		<input type="hidden" name="assignmentId" value="<%= assignmentID %>" />
	    </form>
	</div>
    </div>
    <div id="comments">
	<br />
    	<textarea id="commentBox"></textarea>
        <br />
        <button id="submitComment">add a Comment</button>
        <br />
        <span id="commentAlert" class="error"></span>
    </div>
</body>
</html>
