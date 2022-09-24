String Jsonpayload1 = '{"sentimentsmessage": "The first invoke is queued"}';
FCFunction.getAndInvoke('JavaScript_Tests.sentiment1', Jsonpayload1, 'FCCallback' );
String Jsonpayload2 = '{"sentimentsmessage": "The second invoke is queued"}';
FCFunction.getAndInvoke('JavaScript_Tests.sentiment2', Jsonpayload2, 'FCCallback' );
String Jsonpayload3 = '{"sentimentsmessage": "The third invoke is queued"}';
FCFunction.getAndInvoke('JavaScript_Tests.sentiment3', Jsonpayload3, 'FCCallback' );
String Jsonpayload4 = '{"sentimentsmessage": "The forth invoke is queued"}';
FCFunction.getAndInvoke('JavaScript_Tests.sentiment4', Jsonpayload4, 'FCCallback' );
String Jsonpayload5 = '{"sentimentsmessage": "The fifth invoke is queued"}';
FCFunction.getAndInvoke('JavaScript_Tests.sentiment5', Jsonpayload5, 'FCCallback' );

