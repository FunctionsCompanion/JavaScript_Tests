String Jsonpayload = '{"sentimentsmessage": "This invoke is queued"}';

//Run the  function sync...
FCFunction.getAndInvoke('SentimentFunctions_1_5.sentiment', Jsonpayload);
//FCFunction.getAndInvoke('SentimentFunctions_1_5.sentiment', Jsonpayload);
//FCFunction.getAndInvoke('SentimentFunctions_1_5.sentiment', Jsonpayload);
//Run thge functions async....
//FCFunction.getAndInvoke('SentimentFunctions_1_5.sentiment', Jsonpayload1, 'FCCallback' );


