/// The API for the workflow of obhg request<br/>
/// Business logic class defined by OpenAPI in obhg.spec<br/>
/// Created Mar 17, 2024 15:04:53
Class obhg.impl Extends %REST.Impl [ ProcedureBlock ]
{

/// If ExposeServerExceptions is true, then details of internal errors will be exposed.
Parameter ExposeServerExceptions = 0;

/// returns all facilities filtered eventually by a state<br/>
/// The method arguments hold values for:<br/>
///     state, state<br/>
ClassMethod getFacilities(state As %String) As %Stream.Object
{
    //(Place business logic here)
    //Do ..%SetStatusCode(<HTTP_status_code>)
    //Do ..%SetHeader(<name>,<value>)
    //Quit (Place response here) ; response may be a string, stream or dynamic object
}

/// addFacility<br/>
/// The method arguments hold values for:<br/>
///     Content-Type<br/>
///     body, Obligation messages are comprised of segments grouped together.<br/>
ClassMethod postFacility(
	ContentType As %String,
	body As %DynamicObject) As %DynamicObject
{
    //(Place business logic here)
    //Do ..%SetStatusCode(<HTTP_status_code>)
    //Do ..%SetHeader(<name>,<value>)
    //Quit (Place response here) ; response may be a string, stream or dynamic object
}

}
