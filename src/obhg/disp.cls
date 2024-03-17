/// The API for the workflow of obhg request
/// Dispatch class defined by RESTSpec in obhg.spec
Class obhg.disp Extends %CSP.REST [ GeneratedBy = obhg.spec.cls, ProcedureBlock ]
{

/// The class containing the RESTSpec which generated this class
Parameter SpecificationClass = "obhg.spec";

/// Ignore any writes done directly by the REST method.
Parameter IgnoreWrites = 1;

/// By default convert the input stream to Unicode
Parameter CONVERTINPUTSTREAM = 1;

/// The default response charset is utf-8
Parameter CHARSET = "utf-8";

XData UrlMap [ XMLNamespace = "http://www.intersystems.com/urlmap" ]
{
<Routes>
  <Route Url="/facilities" Method="get" Call="getFacilities" />
  <!-- addFacility -->
  <Route Url="/facilities" Method="post" Call="postFacility" />
</Routes>
}

ClassMethod getFacilities() As %Status
{
    Try {
        If $data(%request.Data("state",2)) {
            Do ##class(%REST.Impl).%ReportRESTError(..#HTTP400BADREQUEST,$$$ERROR($$$RESTDuplicate,"state")) Quit
        }
        If $data(%request.Data("state",1)) {
            Set pstate=%request.Data("state",1)
        }
        Set response=##class(obhg.impl).getFacilities(.pstate)
        Do ##class(obhg.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("obhg.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

/// addFacility
ClassMethod postFacility() As %Status
{
    Try {
        If $case(%request.ContentType,"application/json":0,:1) Do ##class(%REST.Impl).%ReportRESTError(..#HTTP415UNSUPPORTEDMEDIATYPE,$$$ERROR($$$RESTContentType,%request.ContentType)) Quit
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        If $data(%request.CgiEnvs("HTTP_CONTENT_TYPE")) {
            Set pContentType=%request.CgiEnvs("HTTP_CONTENT_TYPE")
        }
        If '$isobject(%request.Content) || (%request.Content.Size=0) Do ##class(%REST.Impl).%ReportRESTError(..#HTTP400BADREQUEST,$$$ERROR($$$RESTRequired,"body")) Quit
        Set pbody=##class(%DynamicAbstractObject).%FromJSON(%request.Content)
        Set response=##class(obhg.impl).postFacility(.pContentType,pbody)
        Do ##class(obhg.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("obhg.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

}
