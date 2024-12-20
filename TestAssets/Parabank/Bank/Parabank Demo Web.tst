---
parasoftVersion: 2024.2.0
productVersion: 10.7.1
schemaVersion: 1
suite:
  $type: TestSuite
  hasEnvironmentConfig: true
  environmentConfig:
    environments:
    - variables:
      - name: SWAGGER
        value: http://qa1.parasoft.com:8090/parabank/services/bank/swagger.yaml
      - name: BASEURL
        value: http://qa1.parasoft.com:8090/parabank/services/bank
      - name: BASE_BASE_URL
        value: http://qa1.parasoft.com:8090
      - name: AUTH_BASEURL
        value: http://localhost:9080
      - name: username
        maskValue: true
        value: AwAAABhPVjlGS3dmQ3IwblBvZUZsS2ZKclpRPT0=
      - name: password
        value: '****'
      - name: HOST
        value: qa1.parasoft.com:9021
      - name: 192_168_56_101_BASE_URL
        value: http://qa1.parasoft.com:8090
      name: qa1.parasoft.com
    - variables:
      - name: SWAGGER
        value: http://dev1.parasoft.com:8090/parabank/services/bank/swagger.yaml
      - name: BASEURL
        value: http://dev1.parasoft.com:8091/parabank/services/bank
      - name: BASE_BASE_URL
        value: http://dev1.parasoft.com:8091
      - name: AUTH_BASEURL
        value: http://localhost:9080
      - name: username
        maskValue: true
        value: AwAAABhPVjlGS3dmQ3IwblBvZUZsS2ZKclpRPT0=
      - name: password
        value: '****'
      - name: HOST
        value: dev1.parasoft.com:9022
      - name: 192_168_56_101_BASE_URL
        value: http://dev1.parasoft.com:8091
      name: dev1.parasoft.com
    - variables:
      - name: SWAGGER
        value: http://18.237.146.177:8090/parabank/services/bank/openapi.yaml
      - name: BASEURL
        value: http://18.237.146.177:8090/parabank/services/bank
      - name: DATABASE_CONNECTION_STRING
        value: hsql://18.237.146.177:9001/parabank
      - name: SV_BASEURL
        value: http://18.237.146.177:9080
      - name: SV_HOST
        value: 18.237.146.177
      - name: SV_PORT
        value: 9080
      - name: SV_USER
        value: demo
      - name: SV_PASS
        value: demo-user
      - name: BASE_BASE_URL
        value: http://18.237.146.177:8090
      - name: AUTH_BASEURL
        value: http://18.237.146.177:9080
      - name: username
        value: '****'
      - name: password
        value: '****'
      name: Docker AWS Demo Server Environment
      active: true
  enabled: true
  name: Test Suite
  rootTestSuite: true
  lastModifiedBy: whaaker
  performance:
    groups:
    - name: "/accounts/{accountId} - GET"
    - id: 1
      name: "/accounts/{accountId}/transactions - GET"
    - id: 2
      name: "/accounts/{accountId}/transactions/amount/{amount} - GET"
    - id: 3
      name: "/accounts/{accountId}/transactions/fromDate/{fromDate}/toDate/{toDate}\
        \ - GET"
    - id: 4
      name: "/accounts/{accountId}/transactions/month/{month}/type/{type} - GET"
    - id: 5
      name: "/accounts/{accountId}/transactions/onDate/{onDate} - GET"
    - id: 6
      name: /cleanDB - POST
    - id: 7
      name: /createAccount - POST
    - id: 8
      name: "/customers/update/{customerId} - POST"
    - id: 9
      name: "/customers/{customerId} - GET"
    - id: 10
      name: "/customers/{customerId}/accounts - GET"
    - id: 11
      name: "/customers/{customerId}/buyPosition - POST"
    - id: 12
      name: "/customers/{customerId}/positions - GET"
    - id: 13
      name: "/customers/{customerId}/sellPosition - POST"
    - id: 14
      name: /deposit - POST
    - id: 15
      name: /initializeDB - POST
    - id: 16
      name: "/login/{username}/{password} - GET"
    - id: 17
      name: "/positions/{positionId} - GET"
    - id: 18
      name: "/positions/{positionId}/{startDate}/{endDate} - GET"
    - id: 19
      name: /requestLoan - POST
    - id: 20
      name: "/setParameter/{name}/{value} - POST"
    - id: 21
      name: /shutdownJmsListener - POST
    - id: 22
      name: /startupJmsListener - POST
    - id: 23
      name: "/transactions/{transactionId} - GET"
    - id: 24
      name: /transfer - POST
    - id: 25
      name: /withdraw - POST
  notes: |-
    Created from: http://192.168.56.101:8080/parabank/services/bank/swagger.yaml
    Timestamp: 2019-06-17 17:37:16
  profileMappingID: 0
  maxProfileMappingID: 32
  propertyOwner:
    properties:
    - $type: DbAccountProperty
      name: Parabank HSQL DB
      account:
        local:
          $type: DbConfigSettings
          password: AwAAAAA=
          uri: "jdbc:hsqldb:${DATABASE_CONNECTION_STRING}"
          username: sa
          driver: org.hsqldb.jdbcDriver
  nextIdentifier: 726
  dataSources:
  - id: ds_193723547_1560818451659_315782778
    impl:
      $type: WritableDataSource
      hasAdvancedOptions: true
      advancedOptions:
        numRows: 1
      model:
        columnCount: 2
        columnIdentifiers:
        - accountBalance
        - accountId
        rowCount: 2756
      resetMode: 2
      writingMode: 3
    name: Accounts
    useAllRows: true
  tests:
  - $type: ToolTest
    testLogic: true
    testID: 724
    name: Extension Tool
    tool:
      $type: MethodTool
      dataSourceNames:
      - Accounts
      iconName: Method
      name: Extension Tool
      method:
        hasCode: true
        code:
          $type: ScriptCode
          input:
            useText: true
            textInput:
              $type: ScriptingTextInput
              text: "def setChromeArguments(input, context)\r\n{\r\n\tSystem.setProperty(\"\
                com.parasoft.browser.BrowserPropertyOptions.CHROME_ARGUMENTS\", \"\
                --remote-allow-origins=*\");\r\n}\r\n"
        hasMethodId: true
        methodId:
          $type: ScriptMethodIdentifier
          functionName: setChromeArguments
          arguments:
          - java.lang.Object
          - java.lang.Object
    writeInput: true
    inputType: InputUsable
    input:
      use: 1
      text:
        text: ""
        type: text/plain
  - $type: TestSuite
    testLogic: true
    testID: 178
    enabled: true
    name: Create Account with Web & DB Validation
    profileMappingID: 0
    maxProfileMappingID: 1
    nextIdentifier: 1
    tests:
    - $type: RESTClientToolTest
      testLogic: true
      testFlowLogic:
        condition: true
      testID: 179
      enabled: true
      name: "/customers/{customerId}/accounts - GET"
      performanceGroup: 10
      tool:
        $type: RESTClient
        dataSourceNames:
        - Accounts
        iconName: RESTClient
        name: "/customers/{customerId}/accounts - GET"
        outputTools:
        - $type: GenericDataBank
          dataSourceNames:
          - Accounts
          iconName: XMLDataBank
          name: JSON Data Bank
          wrappedTool:
            $type: XMLtoDataSource
            dataSourceNames:
            - Accounts
            iconName: XMLDataBank
            name: XML Data Bank
            selectedXPaths:
            - elementOption: 1
              contentOption: 2
              XMLDataBank_ExtractXPath: count(/root/item)+1
              target: 1
              mode: 1
            canonicalizeOutput: true
            xmlMessage: true
            virtualDSCreator:
              writableColumns:
              - dataSourceNames:
                - "Accounts: accountBalance"
                customName: "Test 1: accountsSize"
          conversionStrategy:
            dataFormatName: JSON
            conversionStrategyId: JSON
            conversionStrategyClassName: com.parasoft.xml.convert.json.JsonConversionStrategy
        formJson:
          value:
            $type: ElementValue
            writeType: true
            type:
              $type: ElementType
              hash: 1
              localName: root
              bodyType:
                $type: ComplexType
                hash: 2
                attributes:
                - hash: 3
                  ns: ""
                  name: type
                  fixed: object
                  contentType:
                    $type: StringType
                    hash: 4
                  required: true
                name: rootType
                compositor: true
                compositorObj:
                  $type: AllCompositor
                  hash: 5
            replacedColumn: ""
            values:
            - $type: ComplexValue
              replacedColumn: ""
              attributes:
              - replacedColumn: ""
                value:
                  $type: StringValue
                  replacedColumn: ""
                  value: object
                  xmlEncoding: 2
                useValue: true
              compositorValue: true
              compositorValueObj:
                replacedColumn: ""
                values:
                  $type: CompositorValueSetCollectionSet
                  set:
                  - $type: CompositorValueSet
          elementTypeName: root
        hasServiceInfo: true
        serviceInfo:
          serviceDescriptor:
            $type: StandardServiceDescriptor
            location: http://192.168.56.101:8080/parabank/services/bank/swagger.yaml
          serviceName: ""
          versionName: ""
        jsonBuilder:
          hasValue: true
          value:
            $type: JSONObjectValue
            nameIsNull: true
        schemaURL:
          MessagingClient_SchemaLocation: "${SWAGGER}"
        formInput:
          value:
            $type: ElementValue
            writeType: true
            type:
              $type: ElementType
              hash: 1
              localName: ""
              bodyType:
                $type: ComplexType
                hash: 2
                name: anonymous
                compositor: true
                compositorObj:
                  $type: SequenceCompositor
                  hash: 3
            replacedColumn: ""
            values:
            - $type: ComplexValue
              replacedColumn: ""
              compositorValue: true
              compositorValueObj:
                replacedColumn: ""
                values:
                  $type: CompositorValueSetCollectionSet
                  set:
                  - $type: CompositorValueSet
        constrainToSchema: false
        jmsMessageOutputProvider:
          $type: JMSMessageOutputProvider
          jmsOutputProviderRequest:
            $type: JMSOutputProvider
            name: Request Object
            menuName: Object
          jmsOutputProviderResponse:
            $type: JMSOutputProvider
            name: Response Message Object
            menuName: Message Object
        validResponseRange:
          validResponseRange:
            values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              validResponseRange: 200
        router:
          values:
          - $type: ScriptedValue
          fixedValue:
            $type: StringTestValue
            HTTPClient_Endpoint: "${BASEURL}/customers/12212/accounts?_type=json"
        urlParameters:
          properties:
          - name: _type
            value:
              values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: json
        transportProperties:
          manager:
            properties:
            - $type: HTTPClientHTTPProperties
              followRedirects:
                bool: true
              common:
                auth:
                  useDefault: false
                  customType: 1
                method:
                  values:
                  - $type: ScriptedValue
                  fixedValue:
                    $type: HTTPMethodTestValue
                    method: GET
              keepAlive1_1:
                bool: true
            - $type: HTTPClientHTTPProperties
              followRedirects:
                bool: true
              common:
                auth:
                  useDefault: false
                  customType: 1
                method:
                  values:
                  - $type: ScriptedValue
                  fixedValue:
                    $type: HTTPMethodTestValue
                    method: GET
              protocol: 1
              keepAlive1_1:
                bool: true
            - $type: NoneTransportProperties
          messageExchangePattern:
            inverted: true
        outputProviders:
          requestHeader:
            $type: HTTPNamedToolOutputProvider
            menuName: Transport Header
            name: Request Transport Header
          responseHeader:
            $type: HTTPNamedToolOutputProvider
            menuName: Transport Header
            name: Response Transport Header
          xmlRequestOutput:
            $type: NamedXMLToolOutputProvider
            menuName: Traffic
            name: Request Traffic
          trafficOutput:
            m_name: Traffic Stream
          objectOutput:
            $type: ObjectOutputProvider
            outputTools:
            - $type: TrafficViewer
              iconName: TrafficViewer
              name: Traffic Viewer
              showRequestHeaders: true
              showResponseHeaders: true
            name: Traffic Object
        literal:
          use: 1
          text:
            MessagingClient_LiteralMessage: ""
            type: application/json
          dataSource:
            columnName: "Accounts: accountBalance"
        mode: Literal
        literalQuery:
          isPropertiesRef: true
        literalPath:
          pathElements:
          - values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              value: customers
          - values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              value: 12212
          - values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              value: accounts
        constrainedPath:
          pathParameters:
          - $type: ElementValue
            writeType: true
            type:
              $type: ElementType
              hash: 1
              defaultValue: 0
              localName: customerId
              bodyType:
                $type: IntegerType
                hash: 2
            replacedColumn: ""
            values:
            - $type: IntegerValue
              replacedColumn: ""
              value: 12212
        resourceMethod:
          resourceId: "/customers/{customerId}/accounts"
          httpMethod: GET
        baseUrl:
          values:
          - $type: ScriptedValue
          - $type: WadlTestValue
            value: http://demo:8080/parabank/services/bank
          fixedValue:
            $type: StringTestValue
            value: "${BASEURL}"
    - $type: RESTClientToolTest
      testLogic: true
      testFlowLogic:
        condition: true
      testID: 180
      enabled: true
      name: /createAccount - POST
      performanceGroup: 7
      tool:
        $type: RESTClient
        dataSourceNames:
        - Accounts
        iconName: RESTClient
        name: /createAccount - POST
        outputTools:
        - $type: GenericDataBank
          dataSourceNames:
          - Accounts
          iconName: XMLDataBank
          name: JSON Data Bank
          wrappedTool:
            $type: XMLtoDataSource
            dataSourceNames:
            - Accounts
            iconName: XMLDataBank
            name: XML Data Bank
            selectedXPaths:
            - elementOption: 1
              contentOption: 1
              XMLDataBank_ExtractXPath: "/root/id[1]/text()"
              mode: 1
            - elementOption: 1
              contentOption: 1
              XMLDataBank_ExtractXPath: "/root/balance[1]/text()"
              mode: 1
            canonicalizeOutput: true
            xmlMessage: true
            virtualDSCreator:
              writableColumns:
              - customName: "Test 2: id"
              - customName: "Test 2: balance"
          conversionStrategy:
            dataFormatName: JSON
            conversionStrategyId: JSON
            conversionStrategyClassName: com.parasoft.xml.convert.json.JsonConversionStrategy
        formJson:
          value:
            $type: ElementValue
            writeType: true
            hasReference: true
            qnameAsString: :root
            replacedColumn: ""
            values:
            - $type: ComplexValue
              replacedColumn: ""
              attributes:
              - replacedColumn: ""
                value:
                  $type: StringValue
                  replacedColumn: ""
                  value: object
                  xmlEncoding: 2
                useValue: true
              compositorValue: true
              compositorValueObj:
                replacedColumn: ""
                values:
                  $type: CompositorValueSetCollectionSet
                  set:
                  - $type: CompositorValueSet
          elementTypeName: root
        hasServiceInfo: true
        serviceInfo:
          serviceDescriptor:
            $type: StandardServiceDescriptor
            location: http://192.168.56.101:8080/parabank/services/bank/swagger.yaml
          serviceName: ""
          versionName: ""
        jsonBuilder:
          hasValue: true
          value:
            $type: JSONObjectValue
            nameIsNull: true
        schemaURL:
          MessagingClient_SchemaLocation: "${SWAGGER}"
        formInput:
          value:
            $type: ElementValue
            writeType: true
            hasReference: true
            qnameAsString: ":"
            replacedColumn: ""
            values:
            - $type: ComplexValue
              replacedColumn: ""
              compositorValue: true
              compositorValueObj:
                replacedColumn: ""
                values:
                  $type: CompositorValueSetCollectionSet
                  set:
                  - $type: CompositorValueSet
        constrainToSchema: false
        jmsMessageOutputProvider:
          $type: JMSMessageOutputProvider
          jmsOutputProviderRequest:
            $type: JMSOutputProvider
            name: Request Object
            menuName: Object
          jmsOutputProviderResponse:
            $type: JMSOutputProvider
            name: Response Message Object
            menuName: Message Object
        validResponseRange:
          validResponseRange:
            values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              validResponseRange: 200
        router:
          values:
          - $type: ScriptedValue
          fixedValue:
            $type: StringTestValue
            HTTPClient_Endpoint: "${BASEURL}/createAccount?customerId=12212&newAccountType=0&fromAccountId=54321&_type=json"
        urlParameters:
          properties:
          - name: customerId
            value:
              values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: 12212
          - name: newAccountType
            value:
              values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: 0
          - name: fromAccountId
            value:
              values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: 54321
          - name: _type
            value:
              values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: json
        transportProperties:
          manager:
            properties:
            - $type: HTTPClientHTTPProperties
              followRedirects:
                bool: true
              common:
                auth:
                  useDefault: false
                  customType: 1
                method:
                  values:
                  - $type: ScriptedValue
                  fixedValue:
                    $type: HTTPMethodTestValue
                    method: POST
              keepAlive1_1:
                bool: true
            - $type: HTTPClientHTTPProperties
              followRedirects:
                bool: true
              common:
                auth:
                  useDefault: false
                  customType: 1
                method:
                  values:
                  - $type: ScriptedValue
                  fixedValue:
                    $type: HTTPMethodTestValue
                    method: POST
              protocol: 1
              keepAlive1_1:
                bool: true
            - $type: NoneTransportProperties
          messageExchangePattern:
            inverted: true
        outputProviders:
          requestHeader:
            $type: HTTPNamedToolOutputProvider
            menuName: Transport Header
            name: Request Transport Header
          responseHeader:
            $type: HTTPNamedToolOutputProvider
            menuName: Transport Header
            name: Response Transport Header
          xmlRequestOutput:
            $type: NamedXMLToolOutputProvider
            menuName: Traffic
            name: Request Traffic
          trafficOutput:
            m_name: Traffic Stream
          objectOutput:
            $type: ObjectOutputProvider
            outputTools:
            - $type: TrafficViewer
              iconName: TrafficViewer
              name: Traffic Viewer
              showRequestHeaders: true
              showResponseHeaders: true
            name: Traffic Object
        literal:
          use: 1
          text:
            MessagingClient_LiteralMessage: ""
            type: application/json
          dataSource:
            columnName: "Accounts: accountBalance"
        mode: Literal
        literalQuery:
          isPropertiesRef: true
        constrainedQuery:
          parameters:
          - $type: ElementValue
            writeType: true
            hasReference: true
            qnameAsString: :customerId
            replacedColumn: ""
            values:
            - $type: IntegerValue
              replacedColumn: ""
              value: 12212
          - $type: ElementValue
            writeType: true
            type:
              $type: ElementType
              hash: 1
              defaultValue: 0
              localName: newAccountType
              bodyType:
                $type: IntegerType
                hash: 2
            replacedColumn: ""
            values:
            - $type: IntegerValue
              replacedColumn: ""
              value: 0
          - $type: ElementValue
            writeType: true
            type:
              $type: ElementType
              hash: 1
              defaultValue: 0
              localName: fromAccountId
              bodyType:
                $type: IntegerType
                hash: 2
            replacedColumn: ""
            values:
            - $type: IntegerValue
              replacedColumn: ""
              value: 54321
        literalPath:
          pathElements:
          - values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              value: createAccount
        resourceMethod:
          resourceId: /createAccount
          httpMethod: POST
        baseUrl:
          values:
          - $type: ScriptedValue
          - $type: WadlTestValue
            value: http://demo:8080/parabank/services/bank
          fixedValue:
            $type: StringTestValue
            value: "${BASEURL}"
    - $type: RESTClientToolTest
      testLogic: true
      testFlowLogic:
        condition: true
      testID: 181
      enabled: true
      name: "/customers/{customerId}/accounts - GET 2"
      performanceGroup: 10
      tool:
        $type: RESTClient
        dataSourceNames:
        - Accounts
        iconName: RESTClient
        name: "/customers/{customerId}/accounts - GET 2"
        outputTools:
        - $type: GenericAssertionTool
          dataSourceNames:
          - Accounts
          iconName: XMLAssertor
          name: JSON Assertor
          wrappedTool:
            $type: XMLAssertionTool
            dataSourceNames:
            - Accounts
            iconName: XMLAssertor
            name: XML Assertor
            assertions:
            - $type: OccurrenceAssertion
              timestamp: 1560819084240
              name: Check One Account Added
              extractEntireElement: true
              Assertion_XPath: /root/item
              value:
                name: Count
                value:
                  fixedValue:
                    $type: StringTestValue
                  parameterizedValue:
                    column: "Test 1: accountsSize"
                  selectedIndex: -2
            - $type: NumericAssertion
              timestamp: 1560819232545
              name: Check New Account Balance
              Assertion_XPath: "/root/item[id='${Test 2: id}']/balance"
              value:
                name: Numeric
                value:
                  fixedValue:
                    $type: StringTestValue
                  parameterizedValue:
                    column: "Test 2: balance"
                  selectedIndex: -2
            message:
              $type: ExpectedXMLMessage
              message: true
          conversionStrategy:
            dataFormatName: JSON
            conversionStrategyId: JSON
            conversionStrategyClassName: com.parasoft.xml.convert.json.JsonConversionStrategy
        - $type: GenericDataBank
          dataSourceNames:
          - Accounts
          iconName: XMLDataBank
          name: JSON Data Bank
          wrappedTool:
            $type: XMLtoDataSource
            dataSourceNames:
            - Accounts
            iconName: XMLDataBank
            name: XML Data Bank
            selectedXPaths:
            - elementOption: 1
              contentOption: 1
              XMLDataBank_ExtractXPath: "/root/item[id='${Test 2: id}']/balance[1]/text()"
              mode: 1
            canonicalizeOutput: true
            xmlMessage: true
            virtualDSCreator:
              writableColumns:
              - customName: "Test 3: balance"
          conversionStrategy:
            dataFormatName: JSON
            conversionStrategyId: JSON
            conversionStrategyClassName: com.parasoft.xml.convert.json.JsonConversionStrategy
        formJson:
          value:
            $type: ElementValue
            writeType: true
            hasReference: true
            qnameAsString: :root
            replacedColumn: ""
            values:
            - $type: ComplexValue
              replacedColumn: ""
              attributes:
              - replacedColumn: ""
                value:
                  $type: StringValue
                  replacedColumn: ""
                  value: object
                  xmlEncoding: 2
                useValue: true
              compositorValue: true
              compositorValueObj:
                replacedColumn: ""
                values:
                  $type: CompositorValueSetCollectionSet
                  set:
                  - $type: CompositorValueSet
          elementTypeName: root
        hasServiceInfo: true
        serviceInfo:
          serviceDescriptor:
            $type: StandardServiceDescriptor
            location: http://192.168.56.101:8080/parabank/services/bank/swagger.yaml
          serviceName: ""
          versionName: ""
        jsonBuilder:
          hasValue: true
          value:
            $type: JSONObjectValue
            nameIsNull: true
        schemaURL:
          MessagingClient_SchemaLocation: "${SWAGGER}"
        formInput:
          value:
            $type: ElementValue
            writeType: true
            hasReference: true
            qnameAsString: ":"
            replacedColumn: ""
            values:
            - $type: ComplexValue
              replacedColumn: ""
              compositorValue: true
              compositorValueObj:
                replacedColumn: ""
                values:
                  $type: CompositorValueSetCollectionSet
                  set:
                  - $type: CompositorValueSet
        constrainToSchema: false
        jmsMessageOutputProvider:
          $type: JMSMessageOutputProvider
          jmsOutputProviderRequest:
            $type: JMSOutputProvider
            name: Request Object
            menuName: Object
          jmsOutputProviderResponse:
            $type: JMSOutputProvider
            name: Response Message Object
            menuName: Message Object
        validResponseRange:
          validResponseRange:
            values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              validResponseRange: 200
        router:
          values:
          - $type: ScriptedValue
          fixedValue:
            $type: StringTestValue
            HTTPClient_Endpoint: "${BASEURL}/customers/12212/accounts?_type=json"
        urlParameters:
          properties:
          - name: _type
            value:
              values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: json
        transportProperties:
          manager:
            properties:
            - $type: HTTPClientHTTPProperties
              followRedirects:
                bool: true
              common:
                auth:
                  useDefault: false
                  customType: 1
                method:
                  values:
                  - $type: ScriptedValue
                  fixedValue:
                    $type: HTTPMethodTestValue
                    method: GET
              keepAlive1_1:
                bool: true
            - $type: HTTPClientHTTPProperties
              followRedirects:
                bool: true
              common:
                auth:
                  useDefault: false
                  customType: 1
                method:
                  values:
                  - $type: ScriptedValue
                  fixedValue:
                    $type: HTTPMethodTestValue
                    method: GET
              protocol: 1
              keepAlive1_1:
                bool: true
            - $type: NoneTransportProperties
          messageExchangePattern:
            inverted: true
        outputProviders:
          requestHeader:
            $type: HTTPNamedToolOutputProvider
            menuName: Transport Header
            name: Request Transport Header
          responseHeader:
            $type: HTTPNamedToolOutputProvider
            menuName: Transport Header
            name: Response Transport Header
          xmlRequestOutput:
            $type: NamedXMLToolOutputProvider
            menuName: Traffic
            name: Request Traffic
          trafficOutput:
            m_name: Traffic Stream
          objectOutput:
            $type: ObjectOutputProvider
            outputTools:
            - $type: TrafficViewer
              iconName: TrafficViewer
              name: Traffic Viewer
              showRequestHeaders: true
              showResponseHeaders: true
            name: Traffic Object
        literal:
          use: 1
          text:
            MessagingClient_LiteralMessage: ""
            type: application/json
          dataSource:
            columnName: "Accounts: accountBalance"
        mode: Literal
        literalQuery:
          isPropertiesRef: true
        literalPath:
          pathElements:
          - values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              value: customers
          - values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              value: 12212
          - values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              value: accounts
        constrainedPath:
          pathParameters:
          - $type: ElementValue
            writeType: true
            hasReference: true
            qnameAsString: :customerId
            replacedColumn: ""
            values:
            - $type: IntegerValue
              replacedColumn: ""
              value: 12212
        resourceMethod:
          resourceId: "/customers/{customerId}/accounts"
          httpMethod: GET
        baseUrl:
          values:
          - $type: ScriptedValue
          - $type: WadlTestValue
            value: http://demo:8080/parabank/services/bank
          fixedValue:
            $type: StringTestValue
            value: "${BASEURL}"
    - $type: TestSuite
      testLogic: true
      testFlowLogic:
        condition: true
      testID: 182
      enabled: true
      name: Check Account Details
      abortOnError: 1
      browserOptions:
        browserType:
          useDefault: false
          type:
            $type: SingleBrowserType
            typeValue: 3
      profileMappingID: 29
      runMode: 2
      tests:
      - $type: BrowserTest
        testLogic: true
        testID: 183
        enabled: true
        name: Navigate to "http://192.168.56.101:8080/parabank/"
        tool:
          $type: BrowserTestingTool
          dataSourceNames:
          - Accounts
          usesAutomaticallyGeneratedName: true
          iconName: BrowserTest
          name: "Navigate to \"${WEB_BASE_URL}/parabank/\""
          commands:
          - windowIdentifier:
              BrowserTestingTool_WindowName: ""
            action:
              $type: NavigateAction
              url:
                values:
                - $type: ScriptedValue
                fixedValue:
                  $type: StringTestValue
                  BrowserTestingTool_NavigateURL: "${BASE_BASE_URL}/parabank/"
          delaySettings:
            delays:
            - $type: PageLoadDelay
            - $type: ElementDelay
              windowIdentifier:
                WindowName: ""
              elementState: 1
              specifiedLocator:
                criteria:
                  $type: AttributeCriteria
                  elementName: any
                  attributeName: ""
          originalCommand: true
          command:
            windowIdentifier:
              BrowserTestingTool_WindowName: ""
            action:
              $type: NavigateAction
              url:
                values:
                - $type: ScriptedValue
                fixedValue:
                  $type: StringTestValue
                  BrowserTestingTool_NavigateURL: "${192_168_56_101_BASE_URL}/parabank/"
          browserContents: true
          contents:
            windowContents:
            - parentUrl: ""
              charSet: windows-1252
              url: http://44.238.145.204:8090/parabank/index.htm;jsessionid=237651590FE52D9A472DAAEB14C8F76C
              htmlSize: 1499
              html: !!binary |-
                H4sIAAAAAAAA/6VY6W4bNxD+bT8FwwKBA0Ra2znQSqtNHSdBAsSxEDsNirYIuLuUlhaXZEmuZSHJ
                A/UtO+SeuhvXhiUeM0PO9c3Q4YNXl+fXv49fo8zmPDoM/VeYUZJGobELTpFdKDrClt7ZIDEGR78m
                GdGGWoQ/Xb/p/YyHf4jpn4OESzL76zGMe/UwJZb0OvO7zqRfDx/322W/mrGUDoS0R/WkRwTLiaWP
                vqbMKE4WsCsoesByJbUlwg6/uwtMpM4bipjLZDb87kRU3D2TsfzrLTMsZpzZxQBEp1TUNEkm9Vcl
                DbNMigGJjeSFpcPvYeCNEB0eHIQ5tQRVyo8q5duNzFrVo38X7HaEz6WwVNjeNZgOo6ScVTZ0Bh42
                YjpSLLNw0Jho8pKIGfqGPlOeyJzC6FJwBiq7dSamYVCSOiZYn6FM08kIBwpYYyAJLM3BCpb2nb+Q
                pnyEvRYmo9TiNYduleOZfkCISTRTFhmddKXMaXwDygZETAtO9I0JTvrP+7/U837ORP8GJICpPT+I
                CgMfgIcwimW6QFJAeKQjnMqkyMGUfS6nwFUYqgXJaX8C6+bo0bC8RspuEQPqnDAxJoJyv3zg/sqP
                g0P4acisVDUVQiFZswJJ3Q3BbXBFlk9X1YPomlITJJyCLlM2wWjOUpuN8LPnGGWUTTPw/NNTjGKp
                U6pH+BgighNjRthLdoqTLUczkdK7vUeDMWR5MuFwVh1BzUVOnnRu8uRk002cCPCpC6uOgOZmqqZL
                iHIJgqPXd4pqRkUC+JBRlLLJhGo3DQMFKBKAcaPWxM6bVJdWRj6KRjgmyWyqZSHSASo0P1pTq2Tq
                OS/2b9T0ETqGXyF7mipK7NC7y/mx4I0WdGIhPIrSk5zV61cumeHaEGTNMAw4q8iixvIkloUt7X3m
                huiTcSbYSAuxd8sSakryq2q2ldzBwyAI5vN53ylq5MT2IbuDG6MCpWVaJNZAGigcjavZPUUFDm5I
                I+29TEil8BZxnfg+c0M0BvN3qcGdBV+3dlxY60Jh2dYZIBaOdseyo1m5TpMSzuyFwRt94odbGCut
                O4zVSslaTVrmUqcqUA+68OD+msh18NPBkHbDxVp3o0KW+stBTJidRueFsaCtRu8dYgGunXbSwqNY
                B3tcCUMO0KotSOjE+a5rxhL5nE4Iyk4mQcz48uraCwAPuY9QRWEcfarAMQziyCel33JHtznv0YcJ
                BZHe4nkDCn4DVxeqsRajW8ILWHDo4I3XHjkGtjlgyw8dqSqmzce2uxuP3SPbFHHOWoWqiK1FgUvQ
                O9ERGAbOAyXitXHEpZwVqgyjN1JPpUX+LMTERL4oI0qtMmk6ZcZSXbJ9rGYNcSfuViKnjLJ2uwkW
                7fB7OeIgxIwiolavRiQcPRSxUUMoqLAbdXO2JTn0wdJNoBLaobUCHLi+QC2i7QC/oK4VL+YmhYt9
                ZjZLNZmjN4Dr+7Fzlf1aE2GgkNyT/TyjyQy6JA793A4o3sZ+QWYUvaK+CzRrSLFuRDuX2+3oN6u+
                7b+Z0qX3iy9zkvKHJFfDLz6E73K42EvGOaDyYr9G22WcJQnUWoveQiBK/b9EbfNSZaimWcil7paC
                5YL5Eao7ugCKNieyp9F76FqNRR/oHOTCvGt2egudn1mtN7W54Qw47OQ4eHISnB6fnjbFy+NEV0MB
                wt0dfnqO2277nUEf5Bx9pL1LRQVNl+rfdhHPcAR3fdA06BsctYP76TJ37aLavmZDEd5q3VroJssu
                Q0ozagbdbngiJQBVt3WuYLbdbDdgq+wM1nTcWPffVnX/G6q1WuPb0oHt4Njeh+1gul83dm+Bu3qy
                /UKhKBW5WZbrS1GR7xHQecoxeBSSqopdwQRdELWHe6mBOi8nKx2xq5l1BHReCVItfLnC0T9oXF8b
                nUFy+GUDz0nnNpr22zahTXT3SLe4e6Xf3AoqDCJ28MMugHcN0VP3ZP8Sc/+sWSXZrFH9iKmyBHIk
                cN0gUPr/kfwLSZ9AoToRAAA=
              isTopLevelWindow: true
            browserType:
              $type: SingleBrowserType
              typeValue: 3
          browserOutputProvider:
            msgOutputProviders:
            - $type: HttpMessageOutputProvider
              name: "${WEB_BASE_URL}/parabank/"
              httpMethod:
                values:
                - $type: ScriptedValue
                fixedValue:
                  $type: HTTPMethodTestValue
                  method: GET
              accept: "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9"
              baseUrl: "${WEB_BASE_URL}/parabank/"
              requestHeader:
                $type: HTTPNamedToolOutputProvider
                menuName: Header
                name: "Request Header of ${WEB_BASE_URL}/parabank/"
              requestBody:
                $type: HTTPNamedToolOutputProvider
                menuName: Body
                name: "Request Body of ${WEB_BASE_URL}/parabank/"
              requestStub:
                $type: StubToolOutputProvider
                menuName: Configure Request
                name: "Configure Request for ${WEB_BASE_URL}/parabank/"
              responseHeader:
                $type: HTTPNamedToolOutputProvider
                menuName: Header
                name: "Response Header of ${WEB_BASE_URL}/parabank/"
              responseBody:
                $type: MIMESpecificNamedToolOutputProvider
                menuName: Body
                name: "Response Body of ${WEB_BASE_URL}/parabank/"
                type: text/html
              responseStub:
                $type: StubToolOutputProvider
                menuName: Stub Request/Response
                name: "Stub Request/Response for ${WEB_BASE_URL}/parabank/"
              trafficObject:
                $type: ObjectOutputProvider
                menuName: Traffic Object
                name: "Traffic Object for ${WEB_BASE_URL}/parabank/"
            - $type: HttpMessageOutputProvider
              name: "${WEB_BASE_URL}/parabank/index.htm;jsessionid=237651590FE52D9A472DAAEB14C8F76C"
              httpMethod:
                values:
                - $type: ScriptedValue
                fixedValue:
                  $type: HTTPMethodTestValue
                  method: GET
              accept: "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9"
              baseUrl: "${WEB_BASE_URL}/parabank/index.htm;jsessionid=237651590FE52D9A472DAAEB14C8F76C"
              requestHeader:
                $type: HTTPNamedToolOutputProvider
                menuName: Header
                name: "Request Header of ${WEB_BASE_URL}/parabank/index.htm;jsessionid=237651590FE52D9A472DAAEB14C8F76C"
              requestBody:
                $type: HTTPNamedToolOutputProvider
                menuName: Body
                name: "Request Body of ${WEB_BASE_URL}/parabank/index.htm;jsessionid=237651590FE52D9A472DAAEB14C8F76C"
              requestStub:
                $type: StubToolOutputProvider
                menuName: Configure Request
                name: "Configure Request for ${WEB_BASE_URL}/parabank/index.htm;jsessionid=237651590FE52D9A472DAAEB14C8F76C"
              responseHeader:
                $type: HTTPNamedToolOutputProvider
                menuName: Header
                name: "Response Header of ${WEB_BASE_URL}/parabank/index.htm;jsessionid=237651590FE52D9A472DAAEB14C8F76C"
              responseBody:
                $type: MIMESpecificNamedToolOutputProvider
                menuName: Body
                name: "Response Body of ${WEB_BASE_URL}/parabank/index.htm;jsessionid=237651590FE52D9A472DAAEB14C8F76C"
                type: text/html
              responseStub:
                $type: StubToolOutputProvider
                menuName: Stub Request/Response
                name: "Stub Request/Response for ${WEB_BASE_URL}/parabank/index.htm;jsessionid=237651590FE52D9A472DAAEB14C8F76C"
              trafficObject:
                $type: ObjectOutputProvider
                menuName: Traffic Object
                name: "Traffic Object for ${WEB_BASE_URL}/parabank/index.htm;jsessionid=237651590FE52D9A472DAAEB14C8F76C"
            - $type: HttpMessageOutputProvider
              name: "${WEB_BASE_URL}/parabank/template.css"
              httpMethod:
                values:
                - $type: ScriptedValue
                fixedValue:
                  $type: HTTPMethodTestValue
                  method: GET
              accept: "text/css,*/*;q=0.1"
              referer: http://44.238.145.204:8090/parabank/index.htm;jsessionid=237651590FE52D9A472DAAEB14C8F76C
              baseUrl: "${WEB_BASE_URL}/parabank/template.css"
              requestHeader:
                $type: HTTPNamedToolOutputProvider
                menuName: Header
                name: "Request Header of ${WEB_BASE_URL}/parabank/template.css"
              requestBody:
                $type: HTTPNamedToolOutputProvider
                menuName: Body
                name: "Request Body of ${WEB_BASE_URL}/parabank/template.css"
              requestStub:
                $type: StubToolOutputProvider
                menuName: Configure Request
                name: "Configure Request for ${WEB_BASE_URL}/parabank/template.css"
              responseHeader:
                $type: HTTPNamedToolOutputProvider
                menuName: Header
                name: "Response Header of ${WEB_BASE_URL}/parabank/template.css"
              responseBody:
                $type: MIMESpecificNamedToolOutputProvider
                menuName: Body
                name: "Response Body of ${WEB_BASE_URL}/parabank/template.css"
                type: text/html
              responseStub:
                $type: StubToolOutputProvider
                menuName: Stub Request/Response
                name: "Stub Request/Response for ${WEB_BASE_URL}/parabank/template.css"
              trafficObject:
                $type: ObjectOutputProvider
                menuName: Traffic Object
                name: "Traffic Object for ${WEB_BASE_URL}/parabank/template.css"
            - $type: HttpMessageOutputProvider
              name: "${WEB_BASE_URL}/parabank/style.css"
              httpMethod:
                values:
                - $type: ScriptedValue
                fixedValue:
                  $type: HTTPMethodTestValue
                  method: GET
              accept: "text/css,*/*;q=0.1"
              referer: http://44.238.145.204:8090/parabank/index.htm;jsessionid=237651590FE52D9A472DAAEB14C8F76C
              baseUrl: "${WEB_BASE_URL}/parabank/style.css"
              requestHeader:
                $type: HTTPNamedToolOutputProvider
                menuName: Header
                name: "Request Header of ${WEB_BASE_URL}/parabank/style.css"
              requestBody:
                $type: HTTPNamedToolOutputProvider
                menuName: Body
                name: "Request Body of ${WEB_BASE_URL}/parabank/style.css"
              requestStub:
                $type: StubToolOutputProvider
                menuName: Configure Request
                name: "Configure Request for ${WEB_BASE_URL}/parabank/style.css"
              responseHeader:
                $type: HTTPNamedToolOutputProvider
                menuName: Header
                name: "Response Header of ${WEB_BASE_URL}/parabank/style.css"
              responseBody:
                $type: MIMESpecificNamedToolOutputProvider
                menuName: Body
                name: "Response Body of ${WEB_BASE_URL}/parabank/style.css"
                type: text/html
              responseStub:
                $type: StubToolOutputProvider
                menuName: Stub Request/Response
                name: "Stub Request/Response for ${WEB_BASE_URL}/parabank/style.css"
              trafficObject:
                $type: ObjectOutputProvider
                menuName: Traffic Object
                name: "Traffic Object for ${WEB_BASE_URL}/parabank/style.css"
            - $type: HttpMessageOutputProvider
              name: "${WEB_BASE_URL}/parabank/webjars/angularjs/1.6.9/angular.min.js"
              httpMethod:
                values:
                - $type: ScriptedValue
                fixedValue:
                  $type: HTTPMethodTestValue
                  method: GET
              accept: '*/*'
              referer: http://44.238.145.204:8090/parabank/index.htm;jsessionid=237651590FE52D9A472DAAEB14C8F76C
              baseUrl: "${WEB_BASE_URL}/parabank/webjars/angularjs/1.6.9/angular.min.js"
              requestHeader:
                $type: HTTPNamedToolOutputProvider
                menuName: Header
                name: "Request Header of ${WEB_BASE_URL}/parabank/webjars/angularjs/1.6.9/angular.min.js"
              requestBody:
                $type: HTTPNamedToolOutputProvider
                menuName: Body
                name: "Request Body of ${WEB_BASE_URL}/parabank/webjars/angularjs/1.6.9/angular.min.js"
              requestStub:
                $type: StubToolOutputProvider
                menuName: Configure Request
                name: "Configure Request for ${WEB_BASE_URL}/parabank/webjars/angularjs/1.6.9/angular.min.js"
              responseHeader:
                $type: HTTPNamedToolOutputProvider
                menuName: Header
                name: "Response Header of ${WEB_BASE_URL}/parabank/webjars/angularjs/1.6.9/angular.min.js"
              responseBody:
                $type: MIMESpecificNamedToolOutputProvider
                menuName: Body
                name: "Response Body of ${WEB_BASE_URL}/parabank/webjars/angularjs/1.6.9/angular.min.js"
                type: text/html
              responseStub:
                $type: StubToolOutputProvider
                menuName: Stub Request/Response
                name: "Stub Request/Response for ${WEB_BASE_URL}/parabank/webjars/angularjs/1.6.9/angular.min.js"
              trafficObject:
                $type: ObjectOutputProvider
                menuName: Traffic Object
                name: "Traffic Object for ${WEB_BASE_URL}/parabank/webjars/angularjs/1.6.9/angular.min.js"
            - $type: HttpMessageOutputProvider
              name: https://content-autofill.googleapis.com/v1/pages/ChVDaHJvbWUvMTA3LjAuNTMwNC4xMjISFwnT6_L150ZNXhIFDeeNQA4SBQ3OQUx6?alt=proto
              httpMethod:
                values:
                - $type: ScriptedValue
                fixedValue:
                  $type: HTTPMethodTestValue
                  method: GET
              baseUrl: https://content-autofill.googleapis.com/v1/pages/ChVDaHJvbWUvMTA3LjAuNTMwNC4xMjISFwnT6_L150ZNXhIFDeeNQA4SBQ3OQUx6
              hasUrlArgs: true
              urlArgs:
                properties:
                - name: alt
                  value:
                    fixedValue:
                      $type: StringTestValue
                      value: proto
              requestHeader:
                $type: HTTPNamedToolOutputProvider
                menuName: Header
                name: Request Header of https://content-autofill.googleapis.com/v1/pages/ChVDaHJvbWUvMTA3LjAuNTMwNC4xMjISFwnT6_L150ZNXhIFDeeNQA4SBQ3OQUx6?alt=proto
              requestBody:
                $type: HTTPNamedToolOutputProvider
                menuName: Body
                name: Request Body of https://content-autofill.googleapis.com/v1/pages/ChVDaHJvbWUvMTA3LjAuNTMwNC4xMjISFwnT6_L150ZNXhIFDeeNQA4SBQ3OQUx6?alt=proto
              requestStub:
                $type: StubToolOutputProvider
                menuName: Configure Request
                name: Configure Request for https://content-autofill.googleapis.com/v1/pages/ChVDaHJvbWUvMTA3LjAuNTMwNC4xMjISFwnT6_L150ZNXhIFDeeNQA4SBQ3OQUx6?alt=proto
              responseHeader:
                $type: HTTPNamedToolOutputProvider
                menuName: Header
                name: Response Header of https://content-autofill.googleapis.com/v1/pages/ChVDaHJvbWUvMTA3LjAuNTMwNC4xMjISFwnT6_L150ZNXhIFDeeNQA4SBQ3OQUx6?alt=proto
              responseBody:
                $type: MIMESpecificNamedToolOutputProvider
                menuName: Body
                name: Response Body of https://content-autofill.googleapis.com/v1/pages/ChVDaHJvbWUvMTA3LjAuNTMwNC4xMjISFwnT6_L150ZNXhIFDeeNQA4SBQ3OQUx6?alt=proto
                type: text/html
              responseStub:
                $type: StubToolOutputProvider
                menuName: Stub Request/Response
                name: Stub Request/Response for https://content-autofill.googleapis.com/v1/pages/ChVDaHJvbWUvMTA3LjAuNTMwNC4xMjISFwnT6_L150ZNXhIFDeeNQA4SBQ3OQUx6?alt=proto
              trafficObject:
                $type: ObjectOutputProvider
                menuName: Traffic Object
                name: Traffic Object for https://content-autofill.googleapis.com/v1/pages/ChVDaHJvbWUvMTA3LjAuNTMwNC4xMjISFwnT6_L150ZNXhIFDeeNQA4SBQ3OQUx6?alt=proto
            loadTestConfig:
              requestConfigs:
              - $type: LoadTestRequestConfig
                name: "${192_168_56_101_BASE_URL}/parabank/"
                httpMethod:
                  values:
                  - $type: ScriptedValue
                  fixedValue:
                    $type: HTTPMethodTestValue
                    method: GET
                accept: "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3"
                url:
                  value: "${192_168_56_101_BASE_URL}/parabank/"
                requestData:
                  value: ""
                responseHeader:
                  $type: HTTPNamedToolOutputProvider
                  menuName: Response Header
                  name: "${192_168_56_101_BASE_URL}/parabank/"
                responseBody:
                  $type: MIMESpecificNamedToolOutputProvider
                  menuName: Response Body
                  name: "${192_168_56_101_BASE_URL}/parabank/"
                  type: text/html
              - $type: LoadTestRequestConfig
                name: "${192_168_56_101_BASE_URL}/parabank/index.htm;jsessionid=B8D85438B405E7E9D5723114B4C606ED"
                httpMethod:
                  values:
                  - $type: ScriptedValue
                  fixedValue:
                    $type: HTTPMethodTestValue
                    method: GET
                accept: "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3"
                url:
                  value: "${192_168_56_101_BASE_URL}/parabank/index.htm;jsessionid=B8D85438B405E7E9D5723114B4C606ED"
                requestData:
                  value: ""
                responseHeader:
                  $type: HTTPNamedToolOutputProvider
                  menuName: Response Header
                  name: "${192_168_56_101_BASE_URL}/parabank/index.htm;jsessionid=B8D85438B405E7E9D5723114B4C606ED"
                responseBody:
                  $type: MIMESpecificNamedToolOutputProvider
                  menuName: Response Body
                  name: "${192_168_56_101_BASE_URL}/parabank/index.htm;jsessionid=B8D85438B405E7E9D5723114B4C606ED"
                  type: text/html
            contents:
              $type: BrowserContentsOutputProvider
              outputTools:
              - $type: BrowserContentsViewer
                iconName: BrowserContentsViewer
                name: Browser Contents Viewer
              name: Browser Contents
            traffic:
              $type: NamedToolOutputProvider
              outputTools:
              - $type: TrafficViewer
                iconName: TrafficViewer
                name: Traffic Viewer
                showRequestHeaders: true
                showResponseHeaders: true
              name: HTTP Traffic
      - $type: TestSuite
        testLogic: true
        testID: 184
        enabled: true
        name: "Form: login"
        abortOnError: 1
        profileMappingID: 30
        runMode: 2
        tests:
        - $type: BrowserTest
          testLogic: true
          testID: 185
          enabled: true
          name: Type "john"
          tool:
            $type: BrowserTestingTool
            dataSourceNames:
            - Accounts
            usesAutomaticallyGeneratedName: true
            iconName: BrowserTest
            name: Type "john"
            commands:
            - windowIdentifier:
                BrowserTestingTool_WindowName: ""
                BrowserTestingTool_WindowIndex: 0
              action:
                $type: TypeAction
                location:
                  criteria:
                    $type: AttributeCriteria
                    elementName: input
                    attributeName: name
                    attributeValue:
                      values:
                      - $type: ScriptedValue
                      fixedValue:
                        $type: StringTestValue
                        BrowserTestingTool_LocatorAttributeValue: username
                inputData:
                  values:
                  - $type: ScriptedValue
                  fixedValue:
                    $type: StringTestValue
                    BrowserTestingTool_TypeValue: john
            delaySettings:
              delays:
              - $type: ElementDelay
                windowIdentifier:
                  WindowName: ""
                elementState: 1
                specifiedLocator:
                  criteria:
                    $type: AttributeCriteria
                    elementName: any
                    attributeName: ""
            originalCommand: true
            command:
              windowIdentifier:
                BrowserTestingTool_WindowName: ""
                BrowserTestingTool_WindowIndex: 0
              action:
                $type: TypeAction
                location:
                  criteria:
                    $type: AttributeCriteria
                    elementName: input
                    attributeName: name
                    attributeValue:
                      values:
                      - $type: ScriptedValue
                      fixedValue:
                        $type: StringTestValue
                        BrowserTestingTool_LocatorAttributeValue: username
                inputData:
                  values:
                  - $type: ScriptedValue
                  fixedValue:
                    $type: StringTestValue
                    BrowserTestingTool_TypeValue: john
            browserContents: true
            contents:
              windowContents:
              - parentUrl: ""
                charSet: windows-1252
                url: http://44.238.145.204:8090/parabank/index.htm;jsessionid=237651590FE52D9A472DAAEB14C8F76C
                htmlSize: 1503
                html: !!binary |-
                  H4sIAAAAAAAA/6VY6W4bNxD+bT8FwwKBA0Ra2znQSqtNHSdBAsSxEDsNirYIuLuUlhaXZEmuZSHJ
                  A/UtO+SeuhvXhiUeM0PO9c3Q4YNXl+fXv49fo8zmPDoM/VeYUZJGobELTpFdKDrClt7ZIDEGR78m
                  GdGGWoQ/Xb/p/YyHf4jpn4OESzL76zGMe/UwJZb0OvO7zqRfDx/322W/mrGUDoS0R/WkRwTLiaWP
                  vqbMKE4WsCsoesByJbUlwg6/uwtMpM4bipjLZDb87kRU3D2TsfzrLTMsZpzZxQBEp1TUNEkm9Vcl
                  DbNMigGJjeSFpcPvYeCNEB0eHIQ5tQRVyo8q5duNzFrVo38X7HaEz6WwVNjeNZgOo6ScVTZ0Bh42
                  YjpSLLNw0Jho8pKIGfqGPlOeyJzC6FJwBiq7dSamYVCSOiZYn6FM08kIBwpYYyAJLM3BCpb2nb+Q
                  pnyEvRYmo9TiNYduleOZfkCISTRTFhmddKXMaXwDygZETAtO9I0JTvrP+7/U837ORP8GJICpPT+I
                  CgMfgIcwimW6QFJAeKQjnMqkyMGUfS6nwFUYqgXJaX8C6+bo0bC8RspuEQPqnDAxJoJyv3zg/sqP
                  g0P4acisVDUVQiFZswJJ3Q3BbXBFlk9X1YPomlITJJyCLlM2wWjOUpuN8LPnGGWUTTPw/NNTjGKp
                  U6pH+BgighNjRthLdoqTLUczkdK7vUeDMWR5MuFwVh1BzUVOnnRu8uRk002cCPCpC6uOgOZmqqZL
                  iHIJgqPXd4pqRkUC+JBRlLLJhGo3DQMFKBKAcaPWxM6bVJdWRj6KRjgmyWyqZSHSASo0P1pTq2Tq
                  OS/2b9T0ETqGXyF7mipK7NC7y/mx4I0WdGIhPIrSk5zV61cumeHaEGTNMAw4q8iixvIkloUt7X3m
                  huiTcSbYSAuxd8sSakryq2q2ldzBwyAI5vN53ylq5MT2IbuDG6MCpWVaJNZAGigcjavZPUUFDm5I
                  I+29TEil8BZxnfg+c0M0BvN3qcGdBV+3dlxY60Jh2dYZIBaOdseyo1m5TpMSzuyFwRt94odbGCut
                  O4zVSslaTVrmUqcqUA+68OD+msh18NPBkHbDxVp3o0KW+stBTJidRueFsaCtRu8dYgGunXbSwqNY
                  B3tcCUMO0KotSOjE+a5rxhL5nE4Iyk4mQcz48uraCwAPuY9QRWEcfarAMQziyCel33JHtznv0YcJ
                  BZHe4nkDCn4DVxeqsRajW8ILWLiRmccub8D22DGwzgFffuhYVTFtPrrdrY5ePnaPbFPEOWuVqqK2
                  FgVuQe+6eoSB80KJem0scSlnhSpD6Y3UU2mRPwsxMZEvyqhSq0yaTpmxVJdsH6tZQ9yJvZXoKSOt
                  3W4CRjsMX446CDOjiKjVq1EJRw9FbNQQiirsRt28bUkOfcB0k6iEd2ivAAuuL1CLajsAMKjrxYu5
                  SeFin5nNUk3m6A1g+378XGW/1kQYKCb3ZD/PaDKDTolDT7cDjrexX5AZRa+o7wTNGlqsG9HO5XY7
                  +s2qd/tvpnQp/uLLnKT8IcnV8IsP4bscLvaScQ7IvNiv0XYZZ0kC9daitxCIUv8vUdu8VBmqaRhy
                  qbvlYLlofoQKjy6Aos2J7Gn0HjpXY9EHOge5MO+and5C92dWa05tbjgDDjs5Dp6cBKfHp6dNAfM4
                  0dVQgHB3h5+e47bjfmfQBzlHH2nvUlFB06UauF3EMxzBXR80TfoGR+3gfrrMXbuotq/ZUIi3WrcW
                  usmyy5DSjJpBtyOeSAlA1W2fK5htN9sN2Cq7gzUdN9b+t1Xt/4Zqrdb4tnRhOzi292I7mO7Xkd1b
                  4K6+bL9QKEpFbpbl+lJU5HsEdJ5zDB6GpKpiVzBBF0Tt4V5qos7LyUpX7GpmHQGdl4JUC1+ucPQP
                  GtfXRmeQHH7ZwJPSuY2m/bZNaBPdPdQt7l7pN7eCCoOIHfywC+BtQ/TUPdu/xNw/bVZJNmtUP2Sq
                  LIEcCVxHCJT+/yT/Aou4JH8+EQAA
                isTopLevelWindow: true
              browserType:
                $type: SingleBrowserType
                typeValue: 3
            browserOutputProvider:
              contents:
                $type: BrowserContentsOutputProvider
                outputTools:
                - $type: BrowserContentsViewer
                  iconName: BrowserContentsViewer
                  name: Browser Contents Viewer
                name: Browser Contents
              traffic:
                $type: NamedToolOutputProvider
                outputTools:
                - $type: TrafficViewer
                  iconName: TrafficViewer
                  name: Traffic Viewer
                  showRequestHeaders: true
                  showResponseHeaders: true
                name: HTTP Traffic
        - $type: BrowserTest
          testLogic: true
          testID: 186
          enabled: true
          name: Type "****"
          tool:
            $type: BrowserTestingTool
            usesAutomaticallyGeneratedName: true
            iconName: BrowserTest
            name: Type "****"
            commands:
            - windowIdentifier:
                BrowserTestingTool_WindowName: ""
                BrowserTestingTool_WindowIndex: 0
              action:
                $type: TypePasswordAction
                location:
                  criteria:
                    $type: AttributeCriteria
                    elementName: input
                    attributeName: name
                    attributeValue:
                      values:
                      - $type: ScriptedValue
                      fixedValue:
                        $type: StringTestValue
                        BrowserTestingTool_LocatorAttributeValue: password
                inputData:
                  values:
                  - $type: ScriptedValue
                  fixedValue:
                    $type: PasswordTestValue
                    password: AwAAABhnUkkzRkk1WmFva3p0N0xEM3RCYm5nPT0=
            delaySettings:
              delays:
              - $type: ElementDelay
                windowIdentifier:
                  WindowName: ""
                elementState: 1
                specifiedLocator:
                  criteria:
                    $type: AttributeCriteria
                    elementName: any
                    attributeName: ""
            originalCommand: true
            command:
              windowIdentifier:
                BrowserTestingTool_WindowName: ""
                BrowserTestingTool_WindowIndex: 0
              action:
                $type: TypeAction
                location:
                  criteria:
                    $type: AttributeCriteria
                    elementName: input
                    attributeName: name
                    attributeValue:
                      values:
                      - $type: ScriptedValue
                      fixedValue:
                        $type: StringTestValue
                        BrowserTestingTool_LocatorAttributeValue: password
                inputData:
                  values:
                  - $type: ScriptedValue
                  fixedValue:
                    $type: PasswordTestValue
                    password: AwAAABhnUkkzRkk1WmFva3p0N0xEM3RCYm5nPT0=
            browserContents: true
            contents:
              windowContents:
              - parentUrl: ""
                charSet: windows-1252
                url: http://44.238.145.204:8090/parabank/index.htm;jsessionid=237651590FE52D9A472DAAEB14C8F76C
                htmlSize: 1505
                html: !!binary |-
                  H4sIAAAAAAAA/6VY6W4bNxD+bT8FwwKBA0Ra2znQSqtNHSdBAsSxEDsNirYIuLuUlhaXZEmuZSHJ
                  A/UtO+SeuhvXhiUeM0PO9c3Q4YNXl+fXv49fo8zmPDoM/VeYUZJGobELTpFdKDrClt7ZIDEGR78m
                  GdGGWoQ/Xb/p/YyHf4jpn4OESzL76zGMe/UwJZb0OvO7zqRfDx/322W/mrGUDoS0R/WkRwTLiaWP
                  vqbMKE4WsCsoesByJbUlwg6/uwtMpM4bipjLZDb87kRU3D2TsfzrLTMsZpzZxQBEp1TUNEkm9Vcl
                  DbNMigGJjeSFpcPvYeCNEB0eHIQ5tQRVyo8q5duNzFrVo38X7HaEz6WwVNjeNZgOo6ScVTZ0Bh42
                  YjpSLLNw0Jho8pKIGfqGPlOeyJzC6FJwBiq7dSamYVCSOiZYn6FM08kIBwpYYyAJLM3BCpb2nb+Q
                  pnyEvRYmo9TiNYduleOZfkCISTRTFhmddKXMaXwDygZETAtO9I0JTvrP+7/U837ORP8GJICpPT+I
                  CgMfgIcwimW6QFJAeKQjnMqkyMGUfS6nwFUYqgXJaX8C6+bo0bC8RspuEQPqnDAxJoJyv3zg/sqP
                  g0P4acisVDUVQiFZswJJ3Q3BbXBFlk9X1YPomlITJJyCLlM2wWjOUpuN8LPnGGWUTTPw/NNTjGKp
                  U6pH+BgighNjRthLdoqTLUczkdK7vUeDMWR5MuFwVh1BzUVOnnRu8uRk002cCPCpC6uOgOZmqqZL
                  iHIJgqPXd4pqRkUC+JBRlLLJhGo3DQMFKBKAcaPWxM6bVJdWRj6KRjgmyWyqZSHSASo0P1pTq2Tq
                  OS/2b9T0ETqGXyF7mipK7NC7y/mx4I0WdGIhPIrSk5zV61cumeHaEGTNMAw4q8iixvIkloUt7X3m
                  huiTcSbYSAuxd8sSakryq2q2ldzBwyAI5vN53ylq5MT2IbuDG6MCpWVaJNZAGigcjavZPUUFDm5I
                  I+29TEil8BZxnfg+c0M0BvN3qcGdBV+3dlxY60Jh2dYZIBaOdseyo1m5TpMSzuyFwRt94odbGCut
                  O4zVSslaTVrmUqcqUA+68OD+msh18NPBkHbDxVp3o0KW+stBTJidRueFsaCtRu8dYgGunXbSwqNY
                  B3tcCUMO0KotSOjE+a5rxhL5nE4Iyk4mQcz48uraCwAPuY9QRWEcfarAMQziyCel33JHtznv0YcJ
                  BZHe4nkDCn4DVxeqsRajW8ILWLiRmccub8D22DGwzgFffuhYVTFtPrrdrY5OaS6Xj94j3xRxzlrF
                  qsitxYFr0LuuLmHgPFEiXxtPXMpZocpweiP1VFrkz0JMTOSLMrLUKpOmU2Ys1SXbx2rWEHfibyWC
                  ymhrt5ug0Q7HlyMPQs0oImr1amTC0UMRGzWEwgq7UTd3W5JDHzTdRCohHloswIPrC9Qi2w4QDOqa
                  8WJuUrjYZ2azVJM5egP4vh9DV9mvNREGCso92c8zmsygW+LQ1+2A5G3sF2RG0Svqu0GzhhjrRrRz
                  ud2OfrPq3/6bKV2av/gyJyl/SHI1/OJD+C6Hi71knAM6L/ZrtF3GWZJAzbXoLQSi1P9L1DYvVYZq
                  moZc6m5JWC6cH6HKowugaHMiexq9h+7VWPSBzkEuzLtmp7fQAZrVulObG86Aw06Ogycnwenx6WlT
                  xDxOdDUUINzd4afnuO263xn0Qc7RR9q7VFTQdKkObhfxDEdw1wdNo77BUTu4ny5z1y6q7Ws2FOOt
                  1q2FbrLsMqQ0o2bQ7YonUgJQdVvoCmbbzXYDtsoOYU3HjfX/bVX/v6FaqzW+LZ3YDo7t/dgOpvt1
                  ZfcWuKs32y8UilKRm2W5vhQV+R4BnScdg8chqarYFUzQBVF7uJcaqfNystIZu5pZR0DntSDVwpcr
                  HP2DxvW10Rkkh1828Kx0bqNpv20V2kR3j3WLu1f6za2gwiBiBz/sAnjfED11T/cvMffPm1WSzRrV
                  j5kqSyBHAtcVAqX/X8m/kbEGQEIRAAA=
                isTopLevelWindow: true
              browserType:
                $type: SingleBrowserType
                typeValue: 3
            browserOutputProvider:
              contents:
                $type: BrowserContentsOutputProvider
                outputTools:
                - $type: BrowserContentsViewer
                  iconName: BrowserContentsViewer
                  name: Browser Contents Viewer
                name: Browser Contents
              traffic:
                $type: NamedToolOutputProvider
                outputTools:
                - $type: TrafficViewer
                  iconName: TrafficViewer
                  name: Traffic Viewer
                  showRequestHeaders: true
                  showResponseHeaders: true
                name: HTTP Traffic
        - $type: BrowserTest
          testLogic: true
          testID: 187
          enabled: true
          name: Click "Log In"
          tool:
            $type: BrowserTestingTool
            dataSourceNames:
            - Accounts
            usesAutomaticallyGeneratedName: true
            iconName: BrowserTest
            name: Click "Log In"
            commands:
            - windowIdentifier:
                BrowserTestingTool_WindowName: ""
                BrowserTestingTool_WindowIndex: 0
              action:
                $type: ClickAction
                location:
                  criteria:
                    $type: AttributeCriteria
                    elementName: input
                    attributeName: value
                    attributeValue:
                      values:
                      - $type: ScriptedValue
                      fixedValue:
                        $type: StringTestValue
                        BrowserTestingTool_LocatorAttributeValue: Log In
            delaySettings:
              delays:
              - $type: PageLoadDelay
              - $type: ElementDelay
                windowIdentifier:
                  WindowName: ""
                elementState: 1
                specifiedLocator:
                  criteria:
                    $type: AttributeCriteria
                    elementName: any
                    attributeName: ""
            originalCommand: true
            command:
              windowIdentifier:
                BrowserTestingTool_WindowName: ""
                BrowserTestingTool_WindowIndex: 0
              action:
                $type: ClickAction
                location:
                  criteria:
                    $type: AttributeCriteria
                    elementName: input
                    attributeName: value
                    attributeValue:
                      values:
                      - $type: ScriptedValue
                      fixedValue:
                        $type: StringTestValue
                        BrowserTestingTool_LocatorAttributeValue: Log In
            browserContents: true
            contents:
              windowContents:
              - parentUrl: ""
                charSet: windows-1252
                url: http://44.238.145.204:8090/parabank/overview.htm
                htmlSize: 2797
                html: !!binary |-
                  H4sIAAAAAAAA/+Vda3PbuBX9bP8KhJPpyrsWRVJvWVLqpMl0O2mT2TjtdLY7OxAJiXT4Kgna8WT9
                  g/ovey/4FEU4VvqhbhGPJQLn4gI4uADOeCaXy2d/ePfq6u/vXxOXB/76dCm+li6jznqZ8jufEX4X
                  s5XG2Wc+sNNUW//edmmSMk60j1dv+jPt4udw94+F7Uf00y/n8NwvHx3Kab9R/two6OXjuV5Xi1rX
                  c9gijHivLPRp6AWUs7MvjpfGPr0DNGTkmRfEUcJpyC/ucQDbKAkqi40f2Z8u7tFF0bqful7w5cZL
                  vY3ne/xuAa4dFpY2thslX+Io9bgXhQu6SSM/4+zifjkQJKxPT06WAeOUFJNfFZOvAZfzuM/+mXk3
                  K+1VFHIW8v4VUKcROy8VHCLBF5WbhhfucejoPU3oSxp+Ir+RS9uOspCn5N0NS248drsc5DZo7Xtg
                  4yZsu9IGMbTZQJsBZwFMnzMdF4okzF9pYvipyxjXDlZS6kc0OsJJaidezEma2E0vt2xzDbMc0HCX
                  +TS5TgemPtHnZVkPvFC/Bg/AsWgPrpYDEXmn8LSJnDvh3PFuiOestIB64XsaMl/0eYK/jY+TU/hX
                  2fIoLk0JWdKDCVIHO4elgN69YNceOUTMjqUD22cwzJ231cit53B3pY0nGnGZt3NhNUeWRjZR4rBk
                  pRmwyj5N05UmPOOcqKRrL3TY56927Ue7KO+Z+tBXGRXVQMxhYyRDs2sk6AKWCyOm4aAaWVza2TTG
                  oNfWrz/HLPFYaMOedxlxvO2WJVhcDmI4GQZA7rqmGBeKJTnLRATISttQ+9MugaB1FiRL/N7BtPJG
                  fTtLeRSwRL+Od2fEgJ8w6icsZpRfiCXDtcz8aiZsywMWZvlq+l5Z/wE3KQwdYqh6XA58rzBbV+zT
                  TZTxnPNLfCQfU6Sh0zbFvWazNDf/UJSk5rjtF4PB7e2tjpNNoy3X7SgYXKfxIE4iJ7N5ClEea+v3
                  RekbXQ3wGKGVt7eRTYsJS9w1YvwSH8l7WIKmNSxp5h+yvck4x3DY59qF9dLWD8cz2rSGU20LpD1L
                  tc41EY+ShsWsGw2LmrxpUagb53MqgrU8HfC3Clw8WBrnSA1gmDWB4mBpfeFBU2+eNKC+fwWHIQxw
                  s/4b823BwWZN/hS5IfkQeNwV2wduVmtdnOikjiqoPM3pP1i/muIoZiHNm+azfgcV5C/strwipDHQ
                  8FHcIUVAHF4tX/XAExqmcCLkHq6KEnkDu10ehHVzuHb9mN7lrV9CAeLx7hHtthBgouu85RsoEtE5
                  LPuD8V+7yGKQIgx249aDa024+SiqyKs8fMiP4TZ6hKME7neWctAqxcb6Ka8gb6HmEe3xSC6D/m20
                  I++yg8htxloennUoV5Ga4Lm/H6rF5YdiJo5XWrmu5UJfxrGGIO6XJPJ9vCraNq944le3B9imNgRe
                  fg486/eh9Y/bBUnd6LZsSPr9ddmrh0dnA+t2BK5cs0TE1dQZi65ZGHO6AQWKUy7i/worKt+7hDoe
                  Ci1x/xQ9YLNcRRBSlpO6IOB1tXHguQW9pD7oQfZ9F3Z5Qz1fjOkyOGwPpaojRBqDWPJcz9S2OaU/
                  iUtvQYrpETimackHsssTJDe/GisSmlYynstuncaJCxvmBqQvxt8L4NS0hqNxs/0G9pYX7rS1QPLI
                  5E7LX5d9/7k1nY51w3ik/XPjwFZwJ0hhsMH/28SMUOh1EgPIEcQ8n411ZPKbjZ8WLePJVEILIMfQ
                  clSwdBg/LVom05mEFkCO2kZA5P/RLprO5hJeAFE3XOaGIaFljgN/PC2H6/8/GytDwzS7SUFE3T00
                  NC1LwgsgxwSLaUyPiZdO86dFjTUcSqgB5Kjj5Rhinjwtw9FIQgsgR0WMZZi6+fiI6TJ/WtSMJxJZ
                  h8hxm8k4bjN1mD8taiZTibRDRG1qpjOJvEPkSGqOY+aJEzObS/QdIgoTMzJMicJDRGViTEui8hBR
                  mRhrKJF5iKhMzHAkEXmIqEzMaCyReYioTMx4IvmjJiIqEzOZStQvIioTM51JtC8iKhMzm0uULyIK
                  EzM2DInyRURlYkxLonwRUZkYayhRvoioTMxwJFG+iKhMzGgsUb6IqEzMeCJRvoioTMxkKlG+iKhM
                  zHQmUb6IqEzMbC5RvogoTMzEMCTKFxGViTFNifJFRGVirKFE+SKiMjHDkUT5IqIyMaOxRPkiojIx
                  44lE+SKiMjGTqUT5IqIyMdOZRPkiojIxs7lE+SKiMDFTw5AoX0RUJsY0JcoXEZWJsSyJ8kVEZWKG
                  I4nyRURlYkZjifJFRGVixhOJ8kVEZWImU4nyRURlYqYzifJFRGViZnOJ8kVEYWJmhiFRvoioTIxp
                  SpQvIioTY1kS5YuIysQMhxLli4jKxIzGEuWLiMrEjCcS5YuIysRMphLli4jKxExnEuWLiMrEzOYS
                  5YuIwsTMDUOifBFRmRjTlChfRFQmxrIkyhcRlYkZDiXKFxGViRmNJMoXEZWJGU8kyhcRlYmZTCXK
                  FxGViZnOJMoXEZWJmc0lyhcRdYmxDMPoVr4CUZkY0+xWvgJRmRjL6la+AlGXmPFoKPl/1wI5ihjT
                  MnXT+o/Mj6SmkTOvncfPIdT3dmGREFGk4LyKOPUxAWfHEAHvHOVsPLV0TGDW3ep34SaNLzrmcFo9
                  58n9yibbKOLrh0ZtR34aUxj3UFt/X+QbhGnbfuawlDhMJKJOCXcpJwG9IxtG0mxzzWxOeETcyHfS
                  5kicdWs49QCggOkKBYl5JskG8V35HIXhfrrH10kSJQIrclGeLsuEzdjFDU0IjWOyIlVi58jJfNb7
                  riMJ5Xfn5Odfzi5EQ2ik1/koD80xHyXYb7NQZPokveci7s/Jc8yUe0a+VBzkgL43lxXhScYuumzy
                  Ca3Ilvppw6I2Rf/6jvFelQ341ziJPt8NRBbPMntxOtDID8S0LNOCb21Q7dRz8oV7AYsyvhjCXWXc
                  nzXWnxCduyzs1dNKWBpHYcqaM2qNutoPK6Dv4hFWpU8dk7BLG3DcLGX8rSAsgzjj7KpR22u5hqU7
                  cFYu+zZKXlPbbTepV7BXVHVNVDjKYZ2WWTbrocFiXLZqK2+H07tv1bUXwKYcxtmxAofjquKlNmr7
                  blBSuXxovK3ZJ4xnSXXk6ZtizktikBfwu2gjdff3HR13rWG1eK2ecee2QgAusv3ptRf3uFVted8r
                  /kBizIH/xo8o77XmeE5Mo4PnDtqaLpvMlE+HDNUryvCzPezus6R1VLQMywNl/8QpKU455RluStGf
                  XhTXYn33qhZEK84N7dALbuTKhyi8aBagLWaVZrCihYs9D3DOppHPdNGiV5rmHDKH4EFWDAJOsoUo
                  o9uzg2AT4X6CR/fW8zke2xBxAX3L0rRxVveQ1ZOTYo2qWi+E2MyhEivrXhDxAEfSB57Atdw70+E7
                  gC/QRD6FKNbO4Uc7g5mGme9fgI97+MDxNF4gsJcwuXqqHprvCMBLkiXNtwrAzbcP1gBAeYpu8did
                  3dmrM6H/sciE/hspM0IftJPkpH+ghTwz/QONvi0//Tc7fChL/dedwiGTBem+X239Bmu/4qDx7gqP
                  s4DGBUlQIH+m8Vda76WUL3OC778jAOVTGQGNdydE8V2hPf9F3pfDJpe+T0R1ihcx7jVHF1ngi0Aq
                  m+PrSLjWHNJfsYbANgRBfPQSaITTZIcvJ/l144uXPbRNumdUvtqh2CWwRwZC0C7Fy0rW/wblhgxe
                  JGYAAA==
                isTopLevelWindow: true
              browserType:
                $type: SingleBrowserType
                typeValue: 3
            browserOutputProvider:
              msgOutputProviders:
              - $type: HttpMessageOutputProvider
                name: "${WEB_BASE_URL}/parabank/login.htm"
                unparsedPostData: username=john&password=demo
                httpMethod:
                  values:
                  - $type: ScriptedValue
                  fixedValue:
                    $type: HTTPMethodTestValue
                    method: POST
                accept: "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9"
                referer: http://44.238.145.204:8090/parabank/index.htm;jsessionid=237651590FE52D9A472DAAEB14C8F76C
                contentType: application/x-www-form-urlencoded
                baseUrl: "${WEB_BASE_URL}/parabank/login.htm"
                hasPostData: true
                postData:
                  properties:
                  - name: username
                    value:
                      fixedValue:
                        $type: StringTestValue
                        value: john
                  - name: password
                    value:
                      fixedValue:
                        $type: StringTestValue
                        value: demo
                requestHeader:
                  $type: HTTPNamedToolOutputProvider
                  menuName: Header
                  name: "Request Header of ${WEB_BASE_URL}/parabank/login.htm"
                requestBody:
                  $type: HTTPNamedToolOutputProvider
                  menuName: Body
                  name: "Request Body of ${WEB_BASE_URL}/parabank/login.htm"
                requestStub:
                  $type: StubToolOutputProvider
                  menuName: Configure Request
                  name: "Configure Request for ${WEB_BASE_URL}/parabank/login.htm"
                responseHeader:
                  $type: HTTPNamedToolOutputProvider
                  menuName: Header
                  name: "Response Header of ${WEB_BASE_URL}/parabank/login.htm"
                responseBody:
                  $type: MIMESpecificNamedToolOutputProvider
                  menuName: Body
                  name: "Response Body of ${WEB_BASE_URL}/parabank/login.htm"
                  type: text/html
                responseStub:
                  $type: StubToolOutputProvider
                  menuName: Stub Request/Response
                  name: "Stub Request/Response for ${WEB_BASE_URL}/parabank/login.htm"
                trafficObject:
                  $type: ObjectOutputProvider
                  menuName: Traffic Object
                  name: "Traffic Object for ${WEB_BASE_URL}/parabank/login.htm"
              - $type: HttpMessageOutputProvider
                name: "${WEB_BASE_URL}/parabank/overview.htm"
                httpMethod:
                  values:
                  - $type: ScriptedValue
                  fixedValue:
                    $type: HTTPMethodTestValue
                    method: GET
                accept: "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9"
                referer: http://44.238.145.204:8090/parabank/index.htm;jsessionid=237651590FE52D9A472DAAEB14C8F76C
                baseUrl: "${WEB_BASE_URL}/parabank/overview.htm"
                requestHeader:
                  $type: HTTPNamedToolOutputProvider
                  menuName: Header
                  name: "Request Header of ${WEB_BASE_URL}/parabank/overview.htm"
                requestBody:
                  $type: HTTPNamedToolOutputProvider
                  menuName: Body
                  name: "Request Body of ${WEB_BASE_URL}/parabank/overview.htm"
                requestStub:
                  $type: StubToolOutputProvider
                  menuName: Configure Request
                  name: "Configure Request for ${WEB_BASE_URL}/parabank/overview.htm"
                responseHeader:
                  $type: HTTPNamedToolOutputProvider
                  menuName: Header
                  name: "Response Header of ${WEB_BASE_URL}/parabank/overview.htm"
                responseBody:
                  $type: MIMESpecificNamedToolOutputProvider
                  menuName: Body
                  name: "Response Body of ${WEB_BASE_URL}/parabank/overview.htm"
                  type: text/html
                responseStub:
                  $type: StubToolOutputProvider
                  menuName: Stub Request/Response
                  name: "Stub Request/Response for ${WEB_BASE_URL}/parabank/overview.htm"
                trafficObject:
                  $type: ObjectOutputProvider
                  menuName: Traffic Object
                  name: "Traffic Object for ${WEB_BASE_URL}/parabank/overview.htm"
              - $type: HttpMessageOutputProvider
                name: "${WEB_BASE_URL}/parabank/services_proxy/bank/customers/12212/accounts"
                httpMethod:
                  values:
                  - $type: ScriptedValue
                  fixedValue:
                    $type: HTTPMethodTestValue
                    method: GET
                accept: "application/json, text/plain, */*"
                referer: http://44.238.145.204:8090/parabank/overview.htm
                baseUrl: "${WEB_BASE_URL}/parabank/services_proxy/bank/customers/12212/accounts"
                requestHeader:
                  $type: HTTPNamedToolOutputProvider
                  menuName: Header
                  name: "Request Header of ${WEB_BASE_URL}/parabank/services_proxy/bank/customers/12212/accounts"
                requestBody:
                  $type: HTTPNamedToolOutputProvider
                  menuName: Body
                  name: "Request Body of ${WEB_BASE_URL}/parabank/services_proxy/bank/customers/12212/accounts"
                requestStub:
                  $type: StubToolOutputProvider
                  menuName: Configure Request
                  name: "Configure Request for ${WEB_BASE_URL}/parabank/services_proxy/bank/customers/12212/accounts"
                responseHeader:
                  $type: HTTPNamedToolOutputProvider
                  menuName: Header
                  name: "Response Header of ${WEB_BASE_URL}/parabank/services_proxy/bank/customers/12212/accounts"
                responseBody:
                  $type: MIMESpecificNamedToolOutputProvider
                  menuName: Body
                  name: "Response Body of ${WEB_BASE_URL}/parabank/services_proxy/bank/customers/12212/accounts"
                  type: text/html
                responseStub:
                  $type: StubToolOutputProvider
                  menuName: Stub Request/Response
                  name: "Stub Request/Response for ${WEB_BASE_URL}/parabank/services_proxy/bank/customers/12212/accounts"
                trafficObject:
                  $type: ObjectOutputProvider
                  menuName: Traffic Object
                  name: "Traffic Object for ${WEB_BASE_URL}/parabank/services_proxy/bank/customers/12212/accounts"
              loadTestConfig:
                requestConfigs:
                - $type: LoadTestRequestConfig
                  name: "${192_168_56_101_BASE_URL}/parabank/login.htm"
                  httpMethod:
                    values:
                    - $type: ScriptedValue
                    fixedValue:
                      $type: HTTPMethodTestValue
                      method: POST
                  accept: "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3"
                  referer: http://192.168.56.101:8080/parabank/index.htm;jsessionid=B8D85438B405E7E9D5723114B4C606ED
                  contentType: application/x-www-form-urlencoded
                  url:
                    value: "${192_168_56_101_BASE_URL}/parabank/login.htm"
                  requestData:
                    value: username=john&password=demo
                  responseHeader:
                    $type: HTTPNamedToolOutputProvider
                    menuName: Response Header
                    name: "${192_168_56_101_BASE_URL}/parabank/login.htm"
                  responseBody:
                    $type: MIMESpecificNamedToolOutputProvider
                    menuName: Response Body
                    name: "${192_168_56_101_BASE_URL}/parabank/login.htm"
                    type: text/html
                - $type: LoadTestRequestConfig
                  name: "${192_168_56_101_BASE_URL}/parabank/overview.htm"
                  httpMethod:
                    values:
                    - $type: ScriptedValue
                    fixedValue:
                      $type: HTTPMethodTestValue
                      method: GET
                  accept: "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3"
                  referer: http://192.168.56.101:8080/parabank/index.htm;jsessionid=B8D85438B405E7E9D5723114B4C606ED
                  url:
                    value: "${192_168_56_101_BASE_URL}/parabank/overview.htm"
                  requestData:
                    value: ""
                  responseHeader:
                    $type: HTTPNamedToolOutputProvider
                    menuName: Response Header
                    name: "${192_168_56_101_BASE_URL}/parabank/overview.htm"
                  responseBody:
                    $type: MIMESpecificNamedToolOutputProvider
                    menuName: Response Body
                    name: "${192_168_56_101_BASE_URL}/parabank/overview.htm"
                    type: text/html
                - $type: LoadTestRequestConfig
                  name: "${192_168_56_101_BASE_URL}/parabank/services_proxy/bank/customers/12212/accounts"
                  httpMethod:
                    values:
                    - $type: ScriptedValue
                    fixedValue:
                      $type: HTTPMethodTestValue
                      method: GET
                  accept: "application/json, text/plain, */*"
                  referer: http://192.168.56.101:8080/parabank/overview.htm
                  url:
                    value: "${192_168_56_101_BASE_URL}/parabank/services_proxy/bank/customers/12212/accounts"
                  requestData:
                    value: ""
                  responseHeader:
                    $type: HTTPNamedToolOutputProvider
                    menuName: Response Header
                    name: "${192_168_56_101_BASE_URL}/parabank/services_proxy/bank/customers/12212/accounts"
                  responseBody:
                    $type: MIMESpecificNamedToolOutputProvider
                    menuName: Response Body
                    name: "${192_168_56_101_BASE_URL}/parabank/services_proxy/bank/customers/12212/accounts"
                    type: text/html
              contents:
                $type: BrowserContentsOutputProvider
                outputTools:
                - $type: BrowserContentsViewer
                  iconName: BrowserContentsViewer
                  name: Browser Contents Viewer
                name: Browser Contents
              traffic:
                $type: NamedToolOutputProvider
                outputTools:
                - $type: TrafficViewer
                  iconName: TrafficViewer
                  name: Traffic Viewer
                  showRequestHeaders: true
                  showResponseHeaders: true
                name: HTTP Traffic
      - $type: BrowserTest
        testLogic: true
        testID: 188
        enabled: true
        name: Click "14343"
        tool:
          $type: BrowserTestingTool
          dataSourceNames:
          - Accounts
          usesAutomaticallyGeneratedName: true
          iconName: BrowserTest
          name: "Click ${Accounts: accountBalance}"
          commands:
          - windowIdentifier:
              BrowserTestingTool_WindowName: ""
              BrowserTestingTool_WindowIndex: 0
            action:
              $type: ClickAction
              location:
                criteria:
                  $type: AttributeCriteria
                  elementName: a
                  attributeName: text
                  attributeValue:
                    values:
                    - $type: ScriptedValue
                    fixedValue:
                      $type: StringTestValue
                      BrowserTestingTool_LocatorAttributeValue: 14343
                    parameterizedValue:
                      column: "Test 2: id"
                    selectedIndex: -2
          delaySettings:
            delays:
            - $type: PageLoadDelay
            - $type: ElementDelay
              windowIdentifier:
                WindowName: ""
              elementState: 1
              specifiedLocator:
                criteria:
                  $type: AttributeCriteria
                  elementName: any
                  attributeName: ""
          originalCommand: true
          command:
            windowIdentifier:
              BrowserTestingTool_WindowName: ""
              BrowserTestingTool_WindowIndex: 0
            action:
              $type: ClickAction
              location:
                criteria:
                  $type: AttributeCriteria
                  elementName: a
                  attributeName: text
                  attributeValue:
                    values:
                    - $type: ScriptedValue
                    fixedValue:
                      $type: StringTestValue
                      BrowserTestingTool_LocatorAttributeValue: 14343
          browserContents: true
          contents:
            windowContents:
            - parentUrl: ""
              charSet: windows-1252
              url: http://192.168.56.101:8080/parabank/activity.htm?id=13566
              htmlSize: 2566
              html: !!binary |-
                H4sIAAAAAAAA/8Va6W7cOBL+HT8FIwSbNpKW2rlmpq+s4yQzyWYSI8cuFrODgC2xW0zUopakfCDj
                B9q33CqSkii12kcjmLFhi0exqlj1sVikNL39/N3Rx38fvyCpXmfzval5TFNGk/lU6fOMEX1esFmg
                2ZmOYqWC+d/jlErFNAk+fXw5/DGY/Jav/jOOM0G//n4fysOqmFBNh179zKuEVfF+2DSb1pQnbJwL
                PagqQ5rzNdVs/1vCVZHRc+jNGbnN14WQmuZ6coEKLIVc1xSLTMRfJxfIwo0eqpSvv51wxRc84/p8
                DKwTllc0cSrkt0IorrnIx3ShRFZqNrmYRsYI871bt6Zrpilxk5+5yTcdqdbFkP235Cez4EjkmuV6
                +BFMF5DY1pwN0cCTmo3HRXMNgo6ppM9o/pX8QQ7jWJS5hqfmJ6DyNLIkSJxxIEklW86CqIAhCxgS
                abaG2WsWop+IZNksMNqrlDEdbDhyKx8z6LpMiPuZqljyQhMl41mAxlDjKKJf6Fm4EmKVMVpwFcZi
                bdqijC9URPNVmVH5RUUH4ZPwp6oernkefgHeYHzDEzSdRgaSe1BaiOTc6J7wE8KTWbCmPD+mOcvM
                lG7hn/fv1h781LRaFBUpqEw3pk4TFA4+Aul8vbKzaboBSiumohimI8MVXwbklCc6nQWPnwQkZXyV
                gpsfPQjIQsiEyVkwAvdnVKlZYDjjnOgW0TxP2NmVojOxElYyzUBWBZdakYOHniYPD/o0QRbgSMSS
                x6DWrKjoYlrgagjmL84KJjnLYwgGKSMJXy6ZxOo0KiBkRGDceWNidBST1srEQGcWLGj8dSUBzcmY
                lDIbbEzLDhrGpdJizWT4pVjtkxH85mIoWcGonhiXoS/LrJ4JW+o1y0vrzYxX7R9w9YLqgKG6OAXM
                ObJ5bX26EKW2Nj/EIvmk0Ay9tIrJEx4zZck/uNpWclwCsAJOT09DnKwSS23g/0UVUSFFUsZaAcqL
                YH7sajuyijC+0JrbGxFTN+Et7DyMH2KRHIMLfGpwaZltWntRao1waNs6BX8F88vxjDQddeplgWYv
                VdDrE1PcMtDN2hvoWuxQV2kG2zk5sFbRAf9q4GJg8eJI04Ew8ztcYOk8MNA0i0etaZZ9hDAJCi7m
                /2JZbGywmJPXIs3JhzXXqVk+sOU+mFehvkEVNO5Z82/4rzGxKFhO7VA763fQQN6y02rv2IoBj8cJ
                ymSnDhB2nCLvXPM1OGhJcwURwXL46GrkJaz27SBshsN+nBX03I5+BhXA4/k1xi0BYEa0HfkSqsQI
                B7dfiv+GRVlAjsJgNS45bHiGzSfTRI4sfMirfCmuwUjCxs+UhiTGLaz3toG8gZZrjMeQXIH+jViR
                d+UGcn2sWXg2UK6RKjHut6Fa7X6Y5hTFLHAefg45C8/UYVEE2IXLRYosw51CCqGPtMzqDQP6VQxY
                s0v/9nAII14tx0Sl4tTxIcPhvBLDMVg2XRv82xpslwSy0oOqx2xXNT6JGwzr5ADWiaHVdIHJkctG
                tEkTplp6GYpOYNPkq9zZqeH2tlwvmBxDgpW0ydGmboG9SnwtF4A2nq+C+cHDx0+e+AOhLBstriUe
                08TLhbtEclP80S8vjv7x6u3PO2rwjGaQ+24TvrC9vYLvHIxG4Wi068xPwHvor23Trvqf7aoClCwC
                IocL27ow3XbpGCQziBq9aN6EepWH92G96tsG9qp/N7Q3JwCEu6HF4w7KUuUCthJQwjwH+z7zQnKl
                OZyVoHwCDkiCxj1olIoUeX2m1Qx8b2wuoj5vwgZX2+YYMkWRjHGna7vWDPSreGRgGYMga5J4sFkK
                1qNrVlecejwvIDPrzAfMIso4ZUk9OSzAuXEIhyDnB56jZaqJWc3IjNw9zLK7hmAtEjzftCmCtpKQ
                BZHOz1SYxJiA2BK0BXaQ6JqpMDxiyBJdl2XTyNLdlN9rmpdUgiNcYVc+L9lCWkZVaVdOv1IZp8Hc
                PHblcQjeg13JPHbX4xy12Hker8scXIP/d+eQoWPg/852KFdwyAFDmOeuXD6wAk77sGnhScQVd+X1
                LtbCcHKFXfm8hVTSqlSVduX0nMWOU1W6FqdpZFdhK+i095eovS9dHdjc3nzDaKabPNRu3TaubTR/
                nwiHdzJ9cQ3b//JodiRZwsGW9rk7IhbIxDz+JCzM/5YvVDHp8/vUOszehdmdN+ickivFfxbBfLvc
                jSzFNuKG7GcsttRkIx6OVJixfKVTMp2RkclbrkM8t7QuDXB5zBbCYAPROKie70rShONlp70t7uQ0
                aC97c7fV0On8OZy4wAJpt907zfV1GzCQwXC/r9PCjQzudXo71vd1c+lOQ2pt+N5cP7XsSHjeMqu1
                pcTJ28uqlr261Nvyvxpffcnu6Ifh6NHwwejgp15AbjmVW4l4rnwKTjx49PjHH3pTaXNWJ/XR/T1E
                XX7CEnsGRXG+vF5ohTYIQRQybrnrUujrDLrdGoTz3wRkl7LHhkbRTk5/haybTMsC6koVPdIeS3vL
                wz+9XKV1R/4N7No3yiwBT+Q1Ad4JWdUpy8St7RPohpzLTl/+AWvPxPPOCeyFlEJax7nbj71p9YoA
                1TmhktCigL2wfpUgkjJjg7sbtx5375Pfft+fWATAmLA5tHWp8cwG5Msyt7YZ3DEuvE/u4E3JB1fG
                S9p98q22smkIV0wP/Dcr7n7vcyHF2XlkXzm4K7fIXCUE98k3zddMlHr8cAQ/F/utfS2EkJUPGl0k
                UwVYmfmiaxWMnqETAFapiEN8NTe5gj7sHsKBAUznsNM6aI/ab7Ptah9THae1+pdqD5FUSG1cPvAt
                XY/pSpo0y7m2T5/ClaYdmZLpUuakmr27/CBTwO1T+Bt3exrxF3stBbagyb8C+NPgFLU2nu+PrVaQ
                mMGS2oqqDuUlUPyLMOP0tOkcaFgL7Ar6Hq6IzBVHFJB7zaprXVPcI0GEUdwnwfoVLrypG3dyUI+T
                buqoHZxVOawuT/b8pt6lV11lt9dbLau1wOrW0L8JnBE8AU22kdVblk/XUqmW60/XrXiGlf1GB9Uj
                fkkz5clXfaK30tgNszuHuoD7pdJUlyjIKBO66txEvVbTmAQOecGkxQEBUo83lad+Bcbhay1IK6vh
                9WhwlRIZCw31oCKzgRjOvQh9JxyWw9jUkaUz78We94FA64VIXaoL/jcAS/Agk/5XA5BotDubDuiy
                r+BMsf/tjfem8xf3pvMPUr3x2Ri35Z3zJSO2v3m+ZNBu7593ZnjZW+irmcKBt1yrNl84lWDrFQy8
                CMw1W9PCGQkq5FdaXDG69cq4eufX/gYA89UKAd63EaI4d5dE/yPHldrkMMuIaVYYxRDOSWje8jog
                VcPxOyQd+Cr9E1sIIB0y8Ru7ICCayhV+lfR5kZmPObok/TOqPt1wqwSzancdYT4D+z9S/3m1HSYA
                AA==
              isTopLevelWindow: true
            browserType:
              $type: SingleBrowserType
              typeValue: 3
          browserOutputProvider:
            msgOutputProviders:
            - $type: HttpMessageOutputProvider
              name: "${WEB_BASE_URL}/parabank/activity.htm?id=20226"
              httpMethod:
                values:
                - $type: ScriptedValue
                fixedValue:
                  $type: HTTPMethodTestValue
                  method: GET
              accept: "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9"
              referer: http://44.238.145.204:8090/parabank/overview.htm
              baseUrl: "${WEB_BASE_URL}/parabank/activity.htm"
              hasUrlArgs: true
              urlArgs:
                properties:
                - name: id
                  value:
                    fixedValue:
                      $type: StringTestValue
                      value: 20226
              requestHeader:
                $type: HTTPNamedToolOutputProvider
                menuName: Header
                name: "Request Header of ${WEB_BASE_URL}/parabank/activity.htm?id=20226"
              requestBody:
                $type: HTTPNamedToolOutputProvider
                menuName: Body
                name: "Request Body of ${WEB_BASE_URL}/parabank/activity.htm?id=20226"
              requestStub:
                $type: StubToolOutputProvider
                menuName: Configure Request
                name: "Configure Request for ${WEB_BASE_URL}/parabank/activity.htm?id=20226"
              responseHeader:
                $type: HTTPNamedToolOutputProvider
                menuName: Header
                name: "Response Header of ${WEB_BASE_URL}/parabank/activity.htm?id=20226"
              responseBody:
                $type: MIMESpecificNamedToolOutputProvider
                menuName: Body
                name: "Response Body of ${WEB_BASE_URL}/parabank/activity.htm?id=20226"
                type: text/html
              responseStub:
                $type: StubToolOutputProvider
                menuName: Stub Request/Response
                name: "Stub Request/Response for ${WEB_BASE_URL}/parabank/activity.htm?id=20226"
              trafficObject:
                $type: ObjectOutputProvider
                menuName: Traffic Object
                name: "Traffic Object for ${WEB_BASE_URL}/parabank/activity.htm?id=20226"
            - $type: HttpMessageOutputProvider
              name: "${WEB_BASE_URL}/parabank/services_proxy/bank/accounts/20226"
              httpMethod:
                values:
                - $type: ScriptedValue
                fixedValue:
                  $type: HTTPMethodTestValue
                  method: GET
              accept: "application/json, text/plain, */*"
              referer: http://44.238.145.204:8090/parabank/activity.htm?id=20226
              baseUrl: "${WEB_BASE_URL}/parabank/services_proxy/bank/accounts/20226"
              requestHeader:
                $type: HTTPNamedToolOutputProvider
                menuName: Header
                name: "Request Header of ${WEB_BASE_URL}/parabank/services_proxy/bank/accounts/20226"
              requestBody:
                $type: HTTPNamedToolOutputProvider
                menuName: Body
                name: "Request Body of ${WEB_BASE_URL}/parabank/services_proxy/bank/accounts/20226"
              requestStub:
                $type: StubToolOutputProvider
                menuName: Configure Request
                name: "Configure Request for ${WEB_BASE_URL}/parabank/services_proxy/bank/accounts/20226"
              responseHeader:
                $type: HTTPNamedToolOutputProvider
                menuName: Header
                name: "Response Header of ${WEB_BASE_URL}/parabank/services_proxy/bank/accounts/20226"
              responseBody:
                $type: MIMESpecificNamedToolOutputProvider
                menuName: Body
                name: "Response Body of ${WEB_BASE_URL}/parabank/services_proxy/bank/accounts/20226"
                type: text/html
              responseStub:
                $type: StubToolOutputProvider
                menuName: Stub Request/Response
                name: "Stub Request/Response for ${WEB_BASE_URL}/parabank/services_proxy/bank/accounts/20226"
              trafficObject:
                $type: ObjectOutputProvider
                menuName: Traffic Object
                name: "Traffic Object for ${WEB_BASE_URL}/parabank/services_proxy/bank/accounts/20226"
            - $type: HttpMessageOutputProvider
              name: "${WEB_BASE_URL}/parabank/services_proxy/bank/accounts/20226/transactions"
              httpMethod:
                values:
                - $type: ScriptedValue
                fixedValue:
                  $type: HTTPMethodTestValue
                  method: GET
              accept: "application/json, text/plain, */*"
              referer: http://44.238.145.204:8090/parabank/activity.htm?id=20226
              baseUrl: "${WEB_BASE_URL}/parabank/services_proxy/bank/accounts/20226/transactions"
              requestHeader:
                $type: HTTPNamedToolOutputProvider
                menuName: Header
                name: "Request Header of ${WEB_BASE_URL}/parabank/services_proxy/bank/accounts/20226/transactions"
              requestBody:
                $type: HTTPNamedToolOutputProvider
                menuName: Body
                name: "Request Body of ${WEB_BASE_URL}/parabank/services_proxy/bank/accounts/20226/transactions"
              requestStub:
                $type: StubToolOutputProvider
                menuName: Configure Request
                name: "Configure Request for ${WEB_BASE_URL}/parabank/services_proxy/bank/accounts/20226/transactions"
              responseHeader:
                $type: HTTPNamedToolOutputProvider
                menuName: Header
                name: "Response Header of ${WEB_BASE_URL}/parabank/services_proxy/bank/accounts/20226/transactions"
              responseBody:
                $type: MIMESpecificNamedToolOutputProvider
                menuName: Body
                name: "Response Body of ${WEB_BASE_URL}/parabank/services_proxy/bank/accounts/20226/transactions"
                type: text/html
              responseStub:
                $type: StubToolOutputProvider
                menuName: Stub Request/Response
                name: "Stub Request/Response for ${WEB_BASE_URL}/parabank/services_proxy/bank/accounts/20226/transactions"
              trafficObject:
                $type: ObjectOutputProvider
                menuName: Traffic Object
                name: "Traffic Object for ${WEB_BASE_URL}/parabank/services_proxy/bank/accounts/20226/transactions"
            contents:
              $type: BrowserContentsOutputProvider
              outputTools:
              - $type: BrowserContentsViewer
                dataSourceNames:
                - Accounts
                iconName: BrowserContentsViewer
                name: Browser Contents Viewer
              - $type: BrowserValidationTool
                dataSourceNames:
                - Accounts
                iconName: BrowserValidation
                name: Browser Validation Tool
                extractions:
                - $type: BrowserTestExtraction
                  elementOption: 1
                  contentOption: 1
                  xPath: "/descendant::TD[@class=\"ng-binding ng-scope\"]"
                  mode: 1
                  column:
                    mode: 2
                    customName: "Test 3: 100.00"
                  validationMessage: "Validate ${Test 3: balance} - Validation failed\
                    \ for property \"text[1]\": Actual value found on the page \"\
                    ${ActualValue}\" must be equal to expected value \"${ExpectedValue}\"\
                    ."
                  name: "Validate ${Test 3: balance}"
                  useTextBoundaries: true
                  boundaryValue: true
                  boundaryValueObj:
                    $type: ExtractedTestValue
                    leftBoundary: $
                    rightBoundary: ""
                  validate: true
                  elementName: TD
                  propertyName: "text[1]"
                  origValue: $100.00
                  expectedValue:
                    values:
                    - $type: ScriptedValue
                    fixedValue:
                      $type: StringTestValue
                      BrowserValidationTool_ExpectedValue: 100.00
                    parameterizedValue:
                      column: "Test 2: balance"
                    selectedIndex: -2
                  windowIdentifier:
                    BrowserValidationTool_WindowName: ""
                    BrowserValidationTool_WindowIndex: 0
                  locator:
                    criteria:
                      $type: AttributeCriteria
                      elementName: td
                      attributeName: id
                      attributeValue:
                        values:
                        - $type: ScriptedValue
                        fixedValue:
                          $type: StringTestValue
                          BrowserValidationTool_LocatorAttributeValue: balance
              name: Browser Contents
            traffic:
              $type: NamedToolOutputProvider
              outputTools:
              - $type: TrafficViewer
                iconName: TrafficViewer
                name: Traffic Viewer
                showRequestHeaders: true
                showResponseHeaders: true
              name: HTTP Traffic
      - $type: BrowserTest
        testLogic: true
        testID: 430
        enabled: true
        name: Browser Playback Tool
        tool:
          $type: BrowserTestingTool
          dataSourceNames:
          - Accounts
          usesAutomaticallyGeneratedName: true
          iconName: BrowserTest
          name: Browser Playback Tool
          commands:
          - windowIdentifier:
              BrowserTestingTool_WindowName: ""
              BrowserTestingTool_WindowIndex: 0
            action:
              $type: CloseAction
          delaySettings:
            delays:
            - $type: ElementDelay
              windowIdentifier:
                WindowName: ""
              elementState: 1
              specifiedLocator:
                criteria:
                  $type: AttributeCriteria
                  elementName: any
                  attributeName: ""
          originalCommand: true
          command:
            windowIdentifier:
              BrowserTestingTool_WindowName: ""
            action:
              $type: UnknownAction
              location:
                criteria:
                  $type: AttributeCriteria
                  elementName: any
                  attributeName: id
              action: ""
          browserContents: true
          contents:
            windowContents:
            - parentUrl: ""
              url: ""
              htmlSize: 20
              html: !!binary |-
                H4sIAAAAAAAA/wMAAAAAAAAAAAA=
              isTopLevelWindow: true
            browserType:
              $type: SingleBrowserType
              typeValue: 3
          browserOutputProvider:
            contents:
              $type: BrowserContentsOutputProvider
              outputTools:
              - $type: BrowserContentsViewer
                iconName: BrowserContentsViewer
                name: Browser Contents Viewer
              name: Browser Contents
            traffic:
              $type: NamedToolOutputProvider
              outputTools:
              - $type: TrafficViewer
                iconName: TrafficViewer
                name: Traffic Viewer
                showRequestHeaders: true
                showResponseHeaders: true
              name: HTTP Traffic
    - $type: ToolTest
      testLogic: true
      testFlowLogic:
        condition: true
      testID: 431
      enabled: true
      name: DB Tool
      tool:
        $type: DbTool
        dataSourceNames:
        - Accounts
        iconName: DBTool
        name: DB Tool
        magicToken:
          fixedValue:
            $type: StringTestValue
            value: GO
        outputProviders:
          xmlRequestOutput:
            $type: NamedXMLToolOutputProvider
            name: SQL Query
          xmlResponseOutput:
            $type: NamedXMLToolOutputProvider
            outputTools:
            - $type: XMLAssertionTool
              dataSourceNames:
              - Accounts
              iconName: XMLAssertor
              name: XML Assertor
              assertions:
              - $type: NumericAssertion
                timestamp: 1576780092793
                name: Compare Balance Between UI and DB
                Assertion_XPath: /results/resultSet/rows/row/BALANCE
                value:
                  name: Numeric
                  value:
                    fixedValue:
                      $type: StringTestValue
                    parameterizedValue:
                      column: "Test 2: balance"
                    selectedIndex: -2
              - $type: OccurrenceAssertion
                timestamp: 1583967695108
                name: Occurrence Assertion
                extractEntireElement: true
                Assertion_XPath: /results/resultSet/rows/row
                value:
                  name: Count
                  value:
                    fixedValue:
                      $type: StringTestValue
                      value: 1
              message:
                $type: ExpectedXMLMessage
                message: true
            name: Results as XML
          objectOutput:
            $type: ObjectOutputProvider
            outputTools:
            - $type: TrafficViewer
              iconName: TrafficViewer
              name: Traffic Viewer
              showRequestHeaders: true
              showResponseHeaders: true
            name: Traffic Object
        sqlQuery:
          fixedValue:
            $type: StringTestValue
            useMultipleLines: true
            value: "select * from Account where ID=${Test 2: id}"
        propertyName: Parabank HSQL DB
        shareMode: 1
        failOnSQLException: true
        account:
          local:
            $type: DbConfigSettings
            password: AwAAAAA=
            uri: jdbc:hsqldb:hsql://localhost/parabank
            username: sa
            driver: org.hsqldb.jdbcDriver
  - $type: TestSuite
    testLogic: true
    testFlowLogic:
      condition: true
    testID: 418
    enabled: true
    name: Compare API Response with Web UI Table
    profileMappingID: 0
    maxProfileMappingID: 1
    nextIdentifier: 386
    dataSources:
    - id: ds_-1500309406_1627058694658_1689208754
      impl:
        $type: WritableDataSource
        model:
          columnCount: 2
          columnIdentifiers:
          - API_AccountIds
          - API_Balance
          rowCount: 363
          rows:
          - - 12345
            - -2775.00
          - - 12456
            - 85.45
          - - 12567
            - 75.00
          - - 12678
            - -125.00
          - - 12789
            - 75.00
          - - 12900
            - 0.00
          - - 13011
            - -125.00
          - - 13122
            - 1070.00
          - - 13233
            - 70.00
          - - 13344
            - 1201.10
          - - 13566
            - 1000.00
          - - 13677
            - 1000.00
          - - 13788
            - 100.00
          - - 13899
            - 100.00
          - - 14010
            - 100.00
          - - 14121
            - 100.00
          - - 14232
            - 100.00
          - - 14343
            - 100.00
          - - 14454
            - 100.00
          - - 14565
            - 100.00
          - - 14676
            - 100.00
          - - 14787
            - 100.00
          - - 14898
            - 100.00
          - - 15009
            - 100.00
          - - 15120
            - 100.00
          - - 15231
            - 100.00
          - - 15342
            - 100.00
          - - 15453
            - 100.00
          - - 15564
            - 100.00
          - - 15675
            - 100.00
          - - 15786
            - 100.00
          - - 15897
            - 100.00
          - - 16008
            - 100.00
          - - 16119
            - 100.00
          - - 16230
            - 100.00
          - - 16341
            - 100.00
          - - 16452
            - 100.00
          - - 16563
            - 100.00
          - - 16674
            - 100.00
          - - 16785
            - 100.00
          - - 16896
            - 100.00
          - - 17007
            - 100.00
          - - 17118
            - 100.00
          - - 17229
            - 100.00
          - - 17340
            - 100.00
          - - 17451
            - 100.00
          - - 17562
            - 100.00
          - - 17673
            - 100.00
          - - 17784
            - 100.00
          - - 17895
            - 100.00
          - - 18006
            - 100.00
          - - 18117
            - 100.00
          - - 18228
            - 100.00
          - - 18339
            - 100.00
          - - 18450
            - 100.00
          - - 18561
            - 100.00
          - - 18672
            - 100.00
          - - 18783
            - 100.00
          - - 18894
            - 100.00
          - - 19005
            - 100.00
          - - 19116
            - 100.00
          - - 19227
            - 100.00
          - - 19338
            - 100.00
          - - 19449
            - 100.00
          - - 19560
            - 100.00
          - - 19671
            - 100.00
          - - 19782
            - 100.00
          - - 19893
            - 100.00
          - - 20004
            - 100.00
          - - 20115
            - 100.00
          - - 20226
            - 100.00
          - - 54321
            - 1121.12
        resetMode: 2
        writingMode: 3
      name: Bank Data API
      useAllRows: true
    tests:
    - $type: RESTClientToolTest
      testLogic: true
      testID: 419
      enabled: true
      name: "/customers/{customerId}/accounts - GET"
      performanceGroup: 10
      tool:
        $type: RESTClient
        dataSourceNames:
        - Bank Data API
        iconName: RESTClient
        name: "/customers/{customerId}/accounts - GET"
        outputTools:
        - $type: GenericDataBank
          dataSourceNames:
          - Bank Data API
          iconName: XMLDataBank
          name: JSON Data Bank
          wrappedTool:
            $type: XMLtoDataSource
            dataSourceNames:
            - Bank Data API
            iconName: XMLDataBank
            name: XML Data Bank
            selectedXPaths:
            - elementOption: 1
              contentOption: 1
              XMLDataBank_ExtractXPath: "/root/item/id[1]/text()"
              mode: 1
            - elementOption: 1
              contentOption: 1
              XMLDataBank_ExtractXPath: "/root/item/balance[1]/text()"
              mode: 1
            canonicalizeOutput: true
            xmlMessage: true
            virtualDSCreator:
              writableColumns:
              - dataSourceNames:
                - "Bank Data API: API_AccountIds"
                mode: 2
                customName: "Test 1: id 2"
              - dataSourceNames:
                - "Bank Data API: API_Balance"
                mode: 2
                customName: "Test 1: balance 2"
          conversionStrategy:
            dataFormatName: JSON
            conversionStrategyId: JSON
            conversionStrategyClassName: com.parasoft.xml.convert.json.JsonConversionStrategy
        formJson:
          value:
            $type: ElementValue
            writeType: true
            hasReference: true
            qnameAsString: :root
            replacedColumn: ""
            values:
            - $type: ComplexValue
              replacedColumn: ""
              attributes:
              - replacedColumn: ""
                value:
                  $type: StringValue
                  replacedColumn: ""
                  value: object
                  xmlEncoding: 2
                useValue: true
              compositorValue: true
              compositorValueObj:
                replacedColumn: ""
                values:
                  $type: CompositorValueSetCollectionSet
                  set:
                  - $type: CompositorValueSet
          elementTypeName: root
        hasServiceInfo: true
        serviceInfo:
          serviceDescriptor:
            $type: StandardServiceDescriptor
            location: http://parabank.parasoft.com/parabank/services/bank/swagger.yaml
          serviceName: ""
          versionName: ""
        jsonBuilder:
          hasValue: true
          value:
            $type: JSONObjectValue
            nameIsNull: true
        schemaURL:
          MessagingClient_SchemaLocation: "${SWAGGER}"
        formInput:
          value:
            $type: ElementValue
            writeType: true
            hasReference: true
            qnameAsString: ":"
            replacedColumn: ""
            values:
            - $type: ComplexValue
              replacedColumn: ""
              compositorValue: true
              compositorValueObj:
                replacedColumn: ""
                values:
                  $type: CompositorValueSetCollectionSet
                  set:
                  - $type: CompositorValueSet
        jmsMessageOutputProvider:
          $type: JMSMessageOutputProvider
          jmsOutputProviderRequest:
            $type: JMSOutputProvider
            name: Request Object
            menuName: Object
          jmsOutputProviderResponse:
            $type: JMSOutputProvider
            name: Response Message Object
            menuName: Message Object
        validResponseRange:
          validResponseRange:
            values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              validResponseRange: 200
        router:
          values:
          - $type: ScriptedValue
          fixedValue:
            $type: StringTestValue
            HTTPClient_Endpoint: "${BASEURL}/customers/{customerId}/accounts"
        transportProperties:
          manager:
            properties:
            - $type: HTTPClientHTTPProperties
              followRedirects:
                bool: true
              common:
                auth:
                  useDefault: false
                  customType: 1
                method:
                  values:
                  - $type: ScriptedValue
                  fixedValue:
                    $type: HTTPMethodTestValue
                    method: GET
                httpHeaders:
                  properties:
                  - name: Accept
                    value:
                      values:
                      - $type: ScriptedValue
                      fixedValue:
                        $type: StringTestValue
                        value: application/json
              keepAlive1_1:
                bool: true
            - $type: HTTPClientHTTPProperties
              followRedirects:
                bool: true
              common:
                auth:
                  useDefault: false
                  customType: 1
                method:
                  values:
                  - $type: ScriptedValue
                  fixedValue:
                    $type: HTTPMethodTestValue
                    method: GET
                httpHeaders:
                  properties:
                  - name: Accept
                    value:
                      values:
                      - $type: ScriptedValue
                      fixedValue:
                        $type: StringTestValue
                        value: application/json
              protocol: 1
              keepAlive1_1:
                bool: true
            - $type: NoneTransportProperties
          messageExchangePattern:
            inverted: true
        outputProviders:
          requestHeader:
            $type: HTTPNamedToolOutputProvider
            menuName: Transport Header
            name: Request Transport Header
          responseHeader:
            $type: HTTPNamedToolOutputProvider
            menuName: Transport Header
            name: Response Transport Header
          xmlRequestOutput:
            $type: NamedXMLToolOutputProvider
            menuName: Traffic
            name: Request Traffic
          trafficOutput:
            m_name: Traffic Stream
          objectOutput:
            $type: ObjectOutputProvider
            outputTools:
            - $type: TrafficViewer
              iconName: TrafficViewer
              name: Traffic Viewer
              showRequestHeaders: true
              showResponseHeaders: true
            name: Traffic Object
        literal:
          use: 1
          text:
            MessagingClient_LiteralMessage: ""
            type: application/json
          dataSource:
            columnName: "Accounts: accountBalance"
        mode: Literal
        literalQuery:
          isPropertiesRef: true
        literalPath:
          pathElements:
          - values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              value: customers
          - values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              value: "{customerId}"
          - values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              value: accounts
        constrainedPath:
          pathParameters:
          - $type: ElementValue
            writeType: true
            hasReference: true
            qnameAsString: :customerId
            replacedColumn: ""
            values:
            - $type: IntegerValue
              replacedColumn: ""
              value: 12212
        resourceMethod:
          resourceId: "/customers/{customerId}/accounts"
          httpMethod: GET
        resourceMode: 3
        baseUrl:
          values:
          - $type: ScriptedValue
          - $type: WadlTestValue
            value: http://44.238.145.204:8090/parabank/services/bank
          fixedValue:
            $type: StringTestValue
            value: "${BASEURL}"
    - $type: TestSuite
      testLogic: true
      testID: 420
      enabled: true
      name: Navigate to Accounts Overview Page
      browserOptions:
        browserType:
          useDefault: false
          type:
            $type: SingleBrowserType
            typeValue: 3
      profileMappingID: 0
      maxProfileMappingID: 1
      nextIdentifier: 391
      tests:
      - $type: BrowserTest
        testLogic: true
        testFlowLogic:
          condition: true
        testID: 421
        enabled: true
        name: Browser Playback Tool
        tool:
          $type: BrowserTestingTool
          dataSourceNames:
          - Accounts
          usesAutomaticallyGeneratedName: true
          iconName: BrowserTest
          name: "Navigate to \"${WEB_BASE_URL}/parabank/\""
          commands:
          - windowIdentifier:
              BrowserTestingTool_WindowName: ""
            action:
              $type: NavigateAction
              url:
                values:
                - $type: ScriptedValue
                fixedValue:
                  $type: StringTestValue
                  BrowserTestingTool_NavigateURL: "${BASE_BASE_URL}/parabank/"
          delaySettings:
            delays:
            - $type: ElementDelay
              windowIdentifier:
                WindowName: ""
              elementState: 1
              specifiedLocator:
                criteria:
                  $type: AttributeCriteria
                  elementName: any
                  attributeName: ""
          originalCommand: true
          command:
            windowIdentifier:
              BrowserTestingTool_WindowName: ""
            action:
              $type: UnknownAction
              location:
                criteria:
                  $type: AttributeCriteria
                  elementName: any
                  attributeName: id
              action: ""
          browserContents: true
          contents:
            windowContents:
            - parentUrl: ""
              charSet: windows-1252
              url: https://parabank.parasoft.com/parabank/index.htm;jsessionid=7B4BF291078062091FF9A946395A33D2
              htmlSize: 1499
              html: !!binary |-
                H4sIAAAAAAAA/6VYe28TORD/u/0UxichkEi2LQ9xyWa5UkAgURrRcuh0d0LeXSfrxmsb29s0Aj7Q
                fcsbe595H71WTfyYGXtevxk3vPfq4uzqj/FrlNmcR4eh/wozStIoNHbBKbILRUfY0lsbJMbg6Lck
                I9pQi/Cnqze953j4p5j+NUi4JLO/H8G4Vw9TYkmvM7/tTPr18FG/XfarGUvpQEj7oJ70iGA5sfTh
                t5QZxckCdgVF91iupLZE2OEPd4GJ1HlDEXOZzIY/nIiKu2cyln+7YYbFjDO7GIDolIqaJsmk/qak
                YZZJMSCxkbywdPgjDLwRosODgzCnlqBK+VGlfLuRWat69GvBbkb4TApLhe1dgekwSspZZUNn4GEj
                piPFMgsHjYkmL4mYoe/oM+WJzCmMLgRnoLJbZ2IaBiWpY4L1Gco0nYxwoIA1BpLA0hysYGnf+Qtp
                ykfYa2EySi1ec+hWOZ7pJ4SYRDNlkdFJV8qcxtegbEDEtOBEX5vguP+s/2s97+dM9K9BApja84Oo
                MPABeAijWKYLJAWERzrCqUyKHEzZ53IKXIWhWpCc9iewbh48HJbXSNkNYkCdEybGRFDulw/cX/lx
                cAg/DZmVqqZCKCRrViCpuyG4Da7I8umqehBdU2qChFPQZcomGM1ZarMRfvoMo4yyaQaef3KCUSx1
                SvUIH0FEcGLMCHvJTnGy5WgmUnq792gwhixPJhzOqiOoucjx485NHh9vuokTAT51YdUR0NxM1XQJ
                US5BcPT6VlHNqEgAHzKKUjaZUO2mYaAARQIwbtSa2HmT6tLKyEfRCMckmU21LEQ6QIXmD9bUKpl6
                zov9azV9iI7gV8iepooSO/Tucn4seKMFnVgIj6L0JGf1+qVLZrg2BFkzDAPOKrKosTyJZWFLe5+6
                IfpknAk20kLs3bCEmpL8spptJXfwMAiC+Xzed4oaObF9yO7g2qhAaZkWiTWQBgpH42p2R1GBgxvS
                SHsvE1IpvEVcJ75P3RCNwfxdanBnwdetHRfWulBYtnUGiIWj3bHsaFau06SEM3th8Eaf+OEWxkrr
                DmO1UrJWk5a51KkK1IMuPLi/JnId/HQwpN1wsdbdqJCl/nIQE2Yn0VlhLGir0XuHWIBrJ5208CjW
                wR5XwpADtGoLEjpxvuuasUQ+pxOCspNJEDO+uLzyAsBD7iNUURhHnypwDIM48knpt9zRbc579GFC
                QaS3eN6Agt/A1YVqrMXohvACFhw6eOO1R46BbQ7Y8lNHqopp87Ht7sZj98g2RZyzVqEqYmtR4BL0
                TnQEhoHzQIl4bRxxKWeFKsPojdRTaZE/CzExkS/KiFKrTJpOmbFUl2wfq1lD3Im7lcgpo6zdboJF
                O/xejjgIMaOIqNWrEQlH90Vs1BAKKuxG3ZxtSQ59sHQTqIR2aK0AB67OUYtoO8AvqGvFi7lJ4WKf
                mc1STeboDeD6fuxcZb/SRBgoJHdkP8toMoMuiUM/twOKt7GfkxlFr6jvAs0aUqwb0c7ldjv6zapv
                +2+mdOn94sucpPw+ydXwiw/h2xwu9pJxDqi82K/RdhmnSQK11qK3EIhS/y9R27xUGappFnKpu6Vg
                uWB+hOqOzoGizYnsSfQeulZj0Qc6B7kw75qd3kDnZ1brTW1uOAMOO3oeHD8OTo5Ojpvi5XGiq6EA
                4e4OvzzDbbf9zqAPco4+0t6FooKmS/Vvu4inOIK73msa9A2O2sH9ZJm7dlFtX7OhCG+1bi10k2WX
                IaUZNYNuNzyREoCq2zpXMNtuthuwVXYGazpurPtvq7r/HdVarfFt6cB2cGzvw3Yw3a0bu7PAXT3Z
                fqFQlIrcLMv1pajI9wjoPOUYPApJVcUuYYLOidrDvdRAnZWTlY7Y1cw6AjqvBKkWvlzh6B80rq+N
                TiE5/LKB56RzG037bZvQJrp7pFvcvdLvbgUVBhE7+GkXwLuG6Kl7sn+JuX/WrJJs1qh+xFRZAjkS
                uG4QKP3/SP4Fykqc6ToRAAA=
              isTopLevelWindow: true
            browserType:
              $type: SingleBrowserType
              typeValue: 3
          browserOutputProvider:
            msgOutputProviders:
            - $type: HttpMessageOutputProvider
              name: "${192_168_56_101_BASE_URL}/parabank"
              httpMethod:
                values:
                - $type: ScriptedValue
                fixedValue:
                  $type: HTTPMethodTestValue
                  method: GET
              accept: "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9"
              baseUrl: "${192_168_56_101_BASE_URL}/parabank"
              requestHeader:
                $type: HTTPNamedToolOutputProvider
                menuName: Header
                name: "Request Header of ${192_168_56_101_BASE_URL}/parabank"
              requestBody:
                $type: HTTPNamedToolOutputProvider
                menuName: Body
                name: "Request Body of ${192_168_56_101_BASE_URL}/parabank"
              requestStub:
                $type: StubToolOutputProvider
                menuName: Configure Request
                name: "Configure Request for ${192_168_56_101_BASE_URL}/parabank"
              responseHeader:
                $type: HTTPNamedToolOutputProvider
                menuName: Header
                name: "Response Header of ${192_168_56_101_BASE_URL}/parabank"
              responseBody:
                $type: MIMESpecificNamedToolOutputProvider
                menuName: Body
                name: "Response Body of ${192_168_56_101_BASE_URL}/parabank"
                type: text/html
              responseStub:
                $type: StubToolOutputProvider
                menuName: Stub Request/Response
                name: "Stub Request/Response for ${192_168_56_101_BASE_URL}/parabank"
              trafficObject:
                $type: ObjectOutputProvider
                menuName: Traffic Object
                name: "Traffic Object for ${192_168_56_101_BASE_URL}/parabank"
            - $type: HttpMessageOutputProvider
              name: https://parabank.parasoft.com/parabank
              httpMethod:
                values:
                - $type: ScriptedValue
                fixedValue:
                  $type: HTTPMethodTestValue
                  method: GET
              accept: "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9"
              baseUrl: https://parabank.parasoft.com/parabank
              requestHeader:
                $type: HTTPNamedToolOutputProvider
                menuName: Header
                name: Request Header of https://parabank.parasoft.com/parabank
              requestBody:
                $type: HTTPNamedToolOutputProvider
                menuName: Body
                name: Request Body of https://parabank.parasoft.com/parabank
              requestStub:
                $type: StubToolOutputProvider
                menuName: Configure Request
                name: Configure Request for https://parabank.parasoft.com/parabank
              responseHeader:
                $type: HTTPNamedToolOutputProvider
                menuName: Header
                name: Response Header of https://parabank.parasoft.com/parabank
              responseBody:
                $type: MIMESpecificNamedToolOutputProvider
                menuName: Body
                name: Response Body of https://parabank.parasoft.com/parabank
                type: text/html
              responseStub:
                $type: StubToolOutputProvider
                menuName: Stub Request/Response
                name: Stub Request/Response for https://parabank.parasoft.com/parabank
              trafficObject:
                $type: ObjectOutputProvider
                menuName: Traffic Object
                name: Traffic Object for https://parabank.parasoft.com/parabank
            - $type: HttpMessageOutputProvider
              name: https://parabank.parasoft.com/parabank/
              httpMethod:
                values:
                - $type: ScriptedValue
                fixedValue:
                  $type: HTTPMethodTestValue
                  method: GET
              accept: "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9"
              baseUrl: https://parabank.parasoft.com/parabank/
              requestHeader:
                $type: HTTPNamedToolOutputProvider
                menuName: Header
                name: Request Header of https://parabank.parasoft.com/parabank/
              requestBody:
                $type: HTTPNamedToolOutputProvider
                menuName: Body
                name: Request Body of https://parabank.parasoft.com/parabank/
              requestStub:
                $type: StubToolOutputProvider
                menuName: Configure Request
                name: Configure Request for https://parabank.parasoft.com/parabank/
              responseHeader:
                $type: HTTPNamedToolOutputProvider
                menuName: Header
                name: Response Header of https://parabank.parasoft.com/parabank/
              responseBody:
                $type: MIMESpecificNamedToolOutputProvider
                menuName: Body
                name: Response Body of https://parabank.parasoft.com/parabank/
                type: text/html
              responseStub:
                $type: StubToolOutputProvider
                menuName: Stub Request/Response
                name: Stub Request/Response for https://parabank.parasoft.com/parabank/
              trafficObject:
                $type: ObjectOutputProvider
                menuName: Traffic Object
                name: Traffic Object for https://parabank.parasoft.com/parabank/
            - $type: HttpMessageOutputProvider
              name: https://parabank.parasoft.com/parabank/index.htm;jsessionid=7B4BF291078062091FF9A946395A33D2
              httpMethod:
                values:
                - $type: ScriptedValue
                fixedValue:
                  $type: HTTPMethodTestValue
                  method: GET
              accept: "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9"
              baseUrl: https://parabank.parasoft.com/parabank/index.htm;jsessionid=7B4BF291078062091FF9A946395A33D2
              requestHeader:
                $type: HTTPNamedToolOutputProvider
                menuName: Header
                name: Request Header of https://parabank.parasoft.com/parabank/index.htm;jsessionid=7B4BF291078062091FF9A946395A33D2
              requestBody:
                $type: HTTPNamedToolOutputProvider
                menuName: Body
                name: Request Body of https://parabank.parasoft.com/parabank/index.htm;jsessionid=7B4BF291078062091FF9A946395A33D2
              requestStub:
                $type: StubToolOutputProvider
                menuName: Configure Request
                name: Configure Request for https://parabank.parasoft.com/parabank/index.htm;jsessionid=7B4BF291078062091FF9A946395A33D2
              responseHeader:
                $type: HTTPNamedToolOutputProvider
                menuName: Header
                name: Response Header of https://parabank.parasoft.com/parabank/index.htm;jsessionid=7B4BF291078062091FF9A946395A33D2
              responseBody:
                $type: MIMESpecificNamedToolOutputProvider
                menuName: Body
                name: Response Body of https://parabank.parasoft.com/parabank/index.htm;jsessionid=7B4BF291078062091FF9A946395A33D2
                type: text/html
              responseStub:
                $type: StubToolOutputProvider
                menuName: Stub Request/Response
                name: Stub Request/Response for https://parabank.parasoft.com/parabank/index.htm;jsessionid=7B4BF291078062091FF9A946395A33D2
              trafficObject:
                $type: ObjectOutputProvider
                menuName: Traffic Object
                name: Traffic Object for https://parabank.parasoft.com/parabank/index.htm;jsessionid=7B4BF291078062091FF9A946395A33D2
            - $type: HttpMessageOutputProvider
              name: https://parabank.parasoft.com/parabank/template.css
              httpMethod:
                values:
                - $type: ScriptedValue
                fixedValue:
                  $type: HTTPMethodTestValue
                  method: GET
              accept: "text/css,*/*;q=0.1"
              referer: https://parabank.parasoft.com/parabank/index.htm;jsessionid=7B4BF291078062091FF9A946395A33D2
              baseUrl: https://parabank.parasoft.com/parabank/template.css
              requestHeader:
                $type: HTTPNamedToolOutputProvider
                menuName: Header
                name: Request Header of https://parabank.parasoft.com/parabank/template.css
              requestBody:
                $type: HTTPNamedToolOutputProvider
                menuName: Body
                name: Request Body of https://parabank.parasoft.com/parabank/template.css
              requestStub:
                $type: StubToolOutputProvider
                menuName: Configure Request
                name: Configure Request for https://parabank.parasoft.com/parabank/template.css
              responseHeader:
                $type: HTTPNamedToolOutputProvider
                menuName: Header
                name: Response Header of https://parabank.parasoft.com/parabank/template.css
              responseBody:
                $type: MIMESpecificNamedToolOutputProvider
                menuName: Body
                name: Response Body of https://parabank.parasoft.com/parabank/template.css
                type: text/html
              responseStub:
                $type: StubToolOutputProvider
                menuName: Stub Request/Response
                name: Stub Request/Response for https://parabank.parasoft.com/parabank/template.css
              trafficObject:
                $type: ObjectOutputProvider
                menuName: Traffic Object
                name: Traffic Object for https://parabank.parasoft.com/parabank/template.css
            - $type: HttpMessageOutputProvider
              name: https://parabank.parasoft.com/parabank/style.css
              httpMethod:
                values:
                - $type: ScriptedValue
                fixedValue:
                  $type: HTTPMethodTestValue
                  method: GET
              accept: "text/css,*/*;q=0.1"
              referer: https://parabank.parasoft.com/parabank/index.htm;jsessionid=7B4BF291078062091FF9A946395A33D2
              baseUrl: https://parabank.parasoft.com/parabank/style.css
              requestHeader:
                $type: HTTPNamedToolOutputProvider
                menuName: Header
                name: Request Header of https://parabank.parasoft.com/parabank/style.css
              requestBody:
                $type: HTTPNamedToolOutputProvider
                menuName: Body
                name: Request Body of https://parabank.parasoft.com/parabank/style.css
              requestStub:
                $type: StubToolOutputProvider
                menuName: Configure Request
                name: Configure Request for https://parabank.parasoft.com/parabank/style.css
              responseHeader:
                $type: HTTPNamedToolOutputProvider
                menuName: Header
                name: Response Header of https://parabank.parasoft.com/parabank/style.css
              responseBody:
                $type: MIMESpecificNamedToolOutputProvider
                menuName: Body
                name: Response Body of https://parabank.parasoft.com/parabank/style.css
                type: text/html
              responseStub:
                $type: StubToolOutputProvider
                menuName: Stub Request/Response
                name: Stub Request/Response for https://parabank.parasoft.com/parabank/style.css
              trafficObject:
                $type: ObjectOutputProvider
                menuName: Traffic Object
                name: Traffic Object for https://parabank.parasoft.com/parabank/style.css
            - $type: HttpMessageOutputProvider
              name: https://parabank.parasoft.com/parabank/webjars/angularjs/1.6.9/angular.min.js
              httpMethod:
                values:
                - $type: ScriptedValue
                fixedValue:
                  $type: HTTPMethodTestValue
                  method: GET
              accept: '*/*'
              referer: https://parabank.parasoft.com/parabank/index.htm;jsessionid=7B4BF291078062091FF9A946395A33D2
              baseUrl: https://parabank.parasoft.com/parabank/webjars/angularjs/1.6.9/angular.min.js
              requestHeader:
                $type: HTTPNamedToolOutputProvider
                menuName: Header
                name: Request Header of https://parabank.parasoft.com/parabank/webjars/angularjs/1.6.9/angular.min.js
              requestBody:
                $type: HTTPNamedToolOutputProvider
                menuName: Body
                name: Request Body of https://parabank.parasoft.com/parabank/webjars/angularjs/1.6.9/angular.min.js
              requestStub:
                $type: StubToolOutputProvider
                menuName: Configure Request
                name: Configure Request for https://parabank.parasoft.com/parabank/webjars/angularjs/1.6.9/angular.min.js
              responseHeader:
                $type: HTTPNamedToolOutputProvider
                menuName: Header
                name: Response Header of https://parabank.parasoft.com/parabank/webjars/angularjs/1.6.9/angular.min.js
              responseBody:
                $type: MIMESpecificNamedToolOutputProvider
                menuName: Body
                name: Response Body of https://parabank.parasoft.com/parabank/webjars/angularjs/1.6.9/angular.min.js
                type: text/html
              responseStub:
                $type: StubToolOutputProvider
                menuName: Stub Request/Response
                name: Stub Request/Response for https://parabank.parasoft.com/parabank/webjars/angularjs/1.6.9/angular.min.js
              trafficObject:
                $type: ObjectOutputProvider
                menuName: Traffic Object
                name: Traffic Object for https://parabank.parasoft.com/parabank/webjars/angularjs/1.6.9/angular.min.js
            contents:
              $type: BrowserContentsOutputProvider
              outputTools:
              - $type: BrowserContentsViewer
                iconName: BrowserContentsViewer
                name: Browser Contents Viewer
              name: Browser Contents
            traffic:
              $type: NamedToolOutputProvider
              outputTools:
              - $type: TrafficViewer
                iconName: TrafficViewer
                name: Traffic Viewer
                showRequestHeaders: true
                showResponseHeaders: true
              name: HTTP Traffic
      - $type: BrowserTest
        testLogic: true
        testFlowLogic:
          condition: true
        testID: 422
        enabled: true
        name: Browser Playback Tool
        tool:
          $type: BrowserTestingTool
          dataSourceNames:
          - Accounts
          usesAutomaticallyGeneratedName: true
          iconName: BrowserTest
          name: Type ""
          commands:
          - windowIdentifier:
              BrowserTestingTool_WindowName: ""
              BrowserTestingTool_WindowIndex: 0
            action:
              $type: TypeAction
              location:
                criteria:
                  $type: AttributeCriteria
                  elementName: any
                  attributeName: name
                  attributeValue:
                    values:
                    - $type: ScriptedValue
                    fixedValue:
                      $type: StringTestValue
                      BrowserTestingTool_LocatorAttributeValue: username
              inputData:
                values:
                - $type: ScriptedValue
                fixedValue:
                  $type: StringTestValue
                  BrowserTestingTool_TypeValue: john
          delaySettings:
            delays:
            - $type: ElementDelay
              windowIdentifier:
                WindowName: ""
              elementState: 1
              specifiedLocator:
                criteria:
                  $type: AttributeCriteria
                  elementName: any
                  attributeName: ""
          originalCommand: true
          command:
            windowIdentifier:
              BrowserTestingTool_WindowName: ""
            action:
              $type: UnknownAction
              location:
                criteria:
                  $type: AttributeCriteria
                  elementName: any
                  attributeName: id
              action: ""
          browserContents: true
          contents:
            windowContents:
            - parentUrl: ""
              charSet: windows-1252
              url: https://parabank.parasoft.com/parabank/index.htm;jsessionid=7B4BF291078062091FF9A946395A33D2
              htmlSize: 1503
              html: !!binary |-
                H4sIAAAAAAAA/6VYe28TORD/u/0UxichkEi2LQ9xyWa5UkAgURrRcuh0d0LeXSfrxmsb29s0Aj7Q
                fcsbe595H71WTfyYGXtevxk3vPfq4uzqj/FrlNmcR4eh/wozStIoNHbBKbILRUfY0lsbJMbg6Lck
                I9pQi/Cnqze953j4p5j+NUi4JLO/H8G4Vw9TYkmvM7/tTPr18FG/XfarGUvpQEj7oJ70iGA5sfTh
                t5QZxckCdgVF91iupLZE2OEPd4GJ1HlDEXOZzIY/nIiKu2cyln+7YYbFjDO7GIDolIqaJsmk/qak
                YZZJMSCxkbywdPgjDLwRosODgzCnlqBK+VGlfLuRWat69GvBbkb4TApLhe1dgekwSspZZUNn4GEj
                piPFMgsHjYkmL4mYoe/oM+WJzCmMLgRnoLJbZ2IaBiWpY4L1Gco0nYxwoIA1BpLA0hysYGnf+Qtp
                ykfYa2EySi1ec+hWOZ7pJ4SYRDNlkdFJV8qcxtegbEDEtOBEX5vguP+s/2s97+dM9K9BApja84Oo
                MPABeAijWKYLJAWERzrCqUyKHEzZ53IKXIWhWpCc9iewbh48HJbXSNkNYkCdEybGRFDulw/cX/lx
                cAg/DZmVqqZCKCRrViCpuyG4Da7I8umqehBdU2qChFPQZcomGM1ZarMRfvoMo4yyaQaef3KCUSx1
                SvUIH0FEcGLMCHvJTnGy5WgmUnq792gwhixPJhzOqiOoucjx485NHh9vuokTAT51YdUR0NxM1XQJ
                US5BcPT6VlHNqEgAHzKKUjaZUO2mYaAARQIwbtSa2HmT6tLKyEfRCMckmU21LEQ6QIXmD9bUKpl6
                zov9azV9iI7gV8iepooSO/Tucn4seKMFnVgIj6L0JGf1+qVLZrg2BFkzDAPOKrKosTyJZWFLe5+6
                IfpknAk20kLs3bCEmpL8spptJXfwMAiC+Xzed4oaObF9yO7g2qhAaZkWiTWQBgpH42p2R1GBgxvS
                SHsvE1IpvEVcJ75P3RCNwfxdanBnwdetHRfWulBYtnUGiIWj3bHsaFau06SEM3th8Eaf+OEWxkrr
                DmO1UrJWk5a51KkK1IMuPLi/JnId/HQwpN1wsdbdqJCl/nIQE2Yn0VlhLGir0XuHWIBrJ5208CjW
                wR5XwpADtGoLEjpxvuuasUQ+pxOCspNJEDO+uLzyAsBD7iNUURhHnypwDIM48knpt9zRbc579GFC
                QaS3eN6Agt/A1YVqrMXohvACFq5l5rHLG7A9dgysc8CXnzpWVUybj253q6OXj90j2xRxzlqlqqit
                RYFb0LuuHmHgvFCiXhtLXMpZocpQeiP1VFrkz0JMTOSLMqrUKpOmU2Ys1SXbx2rWEHdibyV6ykhr
                t5uA0Q7Dl6MOwswoImr1alTC0X0RGzWEogq7UTdvW5JDHzDdJCrhHdorwIKrc9Si2g4ADOp68WJu
                UrjYZ2azVJM5egPYvh8/V9mvNBEGiskd2c8ymsygU+LQ0+2A423s52RG0SvqO0GzhhbrRrRzud2O
                frPq3f6bKV2Kv/gyJym/T3I1/OJD+DaHi71knAMyL/ZrtF3GaZJAvbXoLQSi1P9L1DYvVYZqGoZc
                6m45WC6aH6HCo3OgaHMiexK9h87VWPSBzkEuzLtmpzfQ/ZnVmlObG86Aw46eB8ePg5Ojk+OmgHmc
                6GooQLi7wy/PcNtxvzPog5yjj7R3oaig6VIN3C7iKY7grveaJn2Do3ZwP1nmrl1U29dsKMRbrVsL
                3WTZZUhpRs2g2xFPpASg6rbPFcy2m+0GbJXdwZqOG2v/26r2f0e1Vmt8W7qwHRzbe7EdTHfryO4s
                cFdftl8oFKUiN8tyfSkq8j0COs85Bg9DUlWxS5igc6L2cC81UWflZKUrdjWzjoDOS0GqhS9XOPoH
                jetro1NIDr9s4Enp3EbTftsmtInuHuoWd6/0u1tBhUHEDn7aBfC2IXrqnu1fYu6fNqskmzWqHzJV
                lkCOBK4jBEr/f5J/AQht+Dc+EQAA
              isTopLevelWindow: true
            browserType:
              $type: SingleBrowserType
              typeValue: 3
          browserOutputProvider:
            contents:
              $type: BrowserContentsOutputProvider
              outputTools:
              - $type: BrowserContentsViewer
                iconName: BrowserContentsViewer
                name: Browser Contents Viewer
              name: Browser Contents
            traffic:
              $type: NamedToolOutputProvider
              outputTools:
              - $type: TrafficViewer
                iconName: TrafficViewer
                name: Traffic Viewer
                showRequestHeaders: true
                showResponseHeaders: true
              name: HTTP Traffic
      - $type: BrowserTest
        testLogic: true
        testFlowLogic:
          condition: true
        testID: 484
        enabled: true
        name: Type "john" 2
        tool:
          $type: BrowserTestingTool
          dataSourceNames:
          - Accounts
          usesAutomaticallyGeneratedName: true
          iconName: BrowserTest
          name: Type ""
          commands:
          - windowIdentifier:
              BrowserTestingTool_WindowName: ""
              BrowserTestingTool_WindowIndex: 0
            action:
              $type: TypePasswordAction
              location:
                criteria:
                  $type: AttributeCriteria
                  elementName: any
                  attributeName: name
                  attributeValue:
                    values:
                    - $type: ScriptedValue
                    fixedValue:
                      $type: StringTestValue
                      BrowserTestingTool_LocatorAttributeValue: password
              inputData:
                values:
                - $type: ScriptedValue
                fixedValue:
                  $type: PasswordTestValue
                  password: AwAAABhnUkkzRkk1WmFva3p0N0xEM3RCYm5nPT0=
          delaySettings:
            delays:
            - $type: ElementDelay
              windowIdentifier:
                WindowName: ""
              elementState: 1
              specifiedLocator:
                criteria:
                  $type: AttributeCriteria
                  elementName: any
                  attributeName: ""
          originalCommand: true
          command:
            windowIdentifier:
              BrowserTestingTool_WindowName: ""
            action:
              $type: UnknownAction
              location:
                criteria:
                  $type: AttributeCriteria
                  elementName: any
                  attributeName: id
              action: ""
          browserContents: true
          contents:
            windowContents:
            - parentUrl: ""
              charSet: windows-1252
              url: https://parabank.parasoft.com/parabank/index.htm;jsessionid=7B4BF291078062091FF9A946395A33D2
              htmlSize: 1505
              html: !!binary |-
                H4sIAAAAAAAA/6VYe28TORD/u/0UxichkEi2LQ9xyWa5UkAgURrRcuh0d0LeXSfrxmsb29s0Aj7Q
                fcsbe595H71WTfyYGXtevxk3vPfq4uzqj/FrlNmcR4eh/wozStIoNHbBKbILRUfY0lsbJMbg6Lck
                I9pQi/Cnqze953j4p5j+NUi4JLO/H8G4Vw9TYkmvM7/tTPr18FG/XfarGUvpQEj7oJ70iGA5sfTh
                t5QZxckCdgVF91iupLZE2OEPd4GJ1HlDEXOZzIY/nIiKu2cyln+7YYbFjDO7GIDolIqaJsmk/qak
                YZZJMSCxkbywdPgjDLwRosODgzCnlqBK+VGlfLuRWat69GvBbkb4TApLhe1dgekwSspZZUNn4GEj
                piPFMgsHjYkmL4mYoe/oM+WJzCmMLgRnoLJbZ2IaBiWpY4L1Gco0nYxwoIA1BpLA0hysYGnf+Qtp
                ykfYa2EySi1ec+hWOZ7pJ4SYRDNlkdFJV8qcxtegbEDEtOBEX5vguP+s/2s97+dM9K9BApja84Oo
                MPABeAijWKYLJAWERzrCqUyKHEzZ53IKXIWhWpCc9iewbh48HJbXSNkNYkCdEybGRFDulw/cX/lx
                cAg/DZmVqqZCKCRrViCpuyG4Da7I8umqehBdU2qChFPQZcomGM1ZarMRfvoMo4yyaQaef3KCUSx1
                SvUIH0FEcGLMCHvJTnGy5WgmUnq792gwhixPJhzOqiOoucjx485NHh9vuokTAT51YdUR0NxM1XQJ
                US5BcPT6VlHNqEgAHzKKUjaZUO2mYaAARQIwbtSa2HmT6tLKyEfRCMckmU21LEQ6QIXmD9bUKpl6
                zov9azV9iI7gV8iepooSO/Tucn4seKMFnVgIj6L0JGf1+qVLZrg2BFkzDAPOKrKosTyJZWFLe5+6
                IfpknAk20kLs3bCEmpL8spptJXfwMAiC+Xzed4oaObF9yO7g2qhAaZkWiTWQBgpH42p2R1GBgxvS
                SHsvE1IpvEVcJ75P3RCNwfxdanBnwdetHRfWulBYtnUGiIWj3bHsaFau06SEM3th8Eaf+OEWxkrr
                DmO1UrJWk5a51KkK1IMuPLi/JnId/HQwpN1wsdbdqJCl/nIQE2Yn0VlhLGir0XuHWIBrJ5208CjW
                wR5XwpADtGoLEjpxvuuasUQ+pxOCspNJEDO+uLzyAsBD7iNUURhHnypwDIM48knpt9zRbc579GFC
                QaS3eN6Agt/A1YVqrMXohvACFq5l5rHLG7A9dgysc8CXnzpWVUybj253q6NTmsvlo/fIN0Wcs1ax
                KnJrceAa9K6rSxg4T5TI18YTl3JWqDKc3kg9lRb5sxATE/mijCy1yqTplBlLdcn2sZo1xJ34W4mg
                Mtra7SZotMPx5ciDUDOKiFq9GplwdF/ERg2hsMJu1M3dluTQB003kUqIhxYL8ODqHLXItgMEg7pm
                vJibFC72mdks1WSO3gC+78fQVfYrTYSBgnJH9rOMJjPoljj0dTsgeRv7OZlR9Ir6btCsIca6Ee1c
                brej36z6t/9mSpfmL77MScrvk1wNv/gQvs3hYi8Z54DOi/0abZdxmiRQcy16C4Eo9f8Stc1LlaGa
                piGXulsSlgvnR6jy6Bwo2pzInkTvoXs1Fn2gc5AL867Z6Q10gGa17tTmhjPgsKPnwfHj4OTo5Lgp
                Yh4nuhoKEO7u8Msz3Hbd7wz6IOfoI+1dKCpoulQHt4t4iiO4672mUd/gqB3cT5a5axfV9jUbivFW
                69ZCN1l2GVKaUTPodsUTKQGoui10BbPtZrsBW2WHsKbjxvr/tqr/31Gt1Rrflk5sB8f2fmwH0926
                sjsL3NWb7RcKRanIzbJcX4qKfI+AzpOOweOQVFXsEibonKg93EuN1Fk5WemMXc2sI6DzWpBq4csV
                jv5B4/ra6BSSwy8beFY6t9G037YKbaK7x7rF3Sv97lZQYRCxg592AbxviJ66p/uXmPvnzSrJZo3q
                x0yVJZAjgesKgdL/r+RfEmTaCEIRAAA=
              isTopLevelWindow: true
            browserType:
              $type: SingleBrowserType
              typeValue: 3
          browserOutputProvider:
            contents:
              $type: BrowserContentsOutputProvider
              outputTools:
              - $type: BrowserContentsViewer
                iconName: BrowserContentsViewer
                name: Browser Contents Viewer
              name: Browser Contents
            traffic:
              $type: NamedToolOutputProvider
              outputTools:
              - $type: TrafficViewer
                iconName: TrafficViewer
                name: Traffic Viewer
                showRequestHeaders: true
                showResponseHeaders: true
              name: HTTP Traffic
      - $type: BrowserTest
        testLogic: true
        testFlowLogic:
          condition: true
        testID: 485
        enabled: true
        name: Type "****" 2
        tool:
          $type: BrowserTestingTool
          dataSourceNames:
          - Accounts
          usesAutomaticallyGeneratedName: true
          iconName: BrowserTest
          name: Click ""
          commands:
          - windowIdentifier:
              BrowserTestingTool_WindowName: ""
              BrowserTestingTool_WindowIndex: 0
            action:
              $type: ClickAction
              location:
                criteria:
                  $type: AttributeCriteria
                  elementName: input
                  attributeName: value
                  attributeValue:
                    values:
                    - $type: ScriptedValue
                    fixedValue:
                      $type: StringTestValue
                      BrowserTestingTool_LocatorAttributeValue: Log In
          delaySettings:
            delays:
            - $type: ElementDelay
              windowIdentifier:
                WindowName: ""
              elementState: 1
              specifiedLocator:
                criteria:
                  $type: AttributeCriteria
                  elementName: any
                  attributeName: ""
          originalCommand: true
          command:
            windowIdentifier:
              BrowserTestingTool_WindowName: ""
            action:
              $type: UnknownAction
              location:
                criteria:
                  $type: AttributeCriteria
                  elementName: any
                  attributeName: id
              action: ""
          browserContents: true
          contents:
            windowContents:
            - parentUrl: ""
              charSet: windows-1252
              url: https://parabank.parasoft.com/parabank/overview.htm
              htmlSize: 2202
              html: !!binary |-
                H4sIAAAAAAAA/+Va63LbuBX+bT8FwvF05V2LlGzZiXVh6qTxdDtp49k47XS2OzsQCYlwQIIFQNsa
                rx+ob9kDECApivIlf7od22MJwLkA5zsHBzdPX/3p0/vLf158QIlKWbg7NV/ThOA4nEq1YgSpVU5m
                niK3Koik9MI/RgkWkijkfbk877/xJj9ny3+NI8bx118OoNx3xRgr3G/UbxsV3xUP/LrZtCY0JuOM
                q56r9HFGU6zI/l1MZc7wCqgZQa9omnOhcKYm93oACy7SimPOePR1cq9VWOm+TGh6d00lnVNG1WoM
                qmOSOZ4o4eIu55IqyrMxnkvOCkUm99PAgBDu7uxMU6IwssbPrPE1IVEq75N/F/R65r3nmSKZ6l8C
                dB6KyprFUAM8qdQ0tCiqoKMLLPA7nH1Fv6GzKOJFpiT6dE3ENSU306Dk0dyMAk8iyGLmBTnIzEEm
                UCQF8xXxtaOQIGzmmeHLhBDlbXhyqx4j9AwlMhI0V0iKqKnlhsyvwMoAZ8uCYXElg6F/4p+6up/S
                zL8CDYCxkQdV08BE3i6U5jxeGeUxvUY0nnkpptkFzggzfe7ov8bHzi78VLyK544VoSneMBDHunNw
                BfRO02V75BAxSyKDiBEY5pIuPHRDY5XMvOMTDyWELhPw5ujQQ3MuYiJm3gC8zLCUM89o1jbhLV3T
                LCa3j3bN+JKXPWMGfbmoqAYyPGqM5GjYNRKtAtylI6ahoBpZ7vginOug98IPtzkRlGQRzPmEoJgu
                FkTo6jTIITMEAG5YQ6wdRUSJMjIBMvPmOPq6FBC08RgVgvU2zCqF+lEhFU+J8K/y5T4awG/G+4Lk
                BKuJcZn2ZcEqS8hCpSQrSm8y6to/60kKQ4cYqorTgFHLFlbo4zkvVIn5mS6iL1LD0Mkr9VyLiCzZ
                P9vaVnY97cdBcHNz42tjJV8oP+JpcCXzIBc8LiIlIcpzL7ywtW9UFeg0gittH3mErcFb1DVi/EwX
                0QW4oMkNLi3YJtrzQikdDutYJ+AvL3w4njVPazjVtNCwF9Lr9IkpbhG0VjcEbUspaiu1cGmTDVaX
                HfRfFbg6sTTySE3QYdYk2MTS+tKJpp48MsWMXUIyhAHOw38QFhkM5iH6C08y9DmlKjHTB1bWw9Bm
                dFRHFTTulvBv+K+GmOckw6VoafUnaEB/IzduidgaAw0ddg2xAbG5tDyqQQmcScgIpYZLW0PnMNu3
                B2EtDssuy/GqlH4HFYjH1RPkFhBgputS8hyqyHQObn8w/msVRQ5bEQKzcUFhWTNqvpgm9L4MH/Rj
                tuBPUCRgfSdSwV7FTqyfygb0EVqeIK9Tsgv6j3yJPhUbkduMtTI861CuIlXovL8eqnbx05uZPJ95
                zq/O0Wd57mmini+CM6aXijbPeyVYtXoAr4wg8Mo88KrfB+kfF2MkE37jBFG/H7peqU6dDVq3IlCV
                DB3FLE2dsZgMLbPCc9iBapNt/F/qhkr3UuCY6o2WWX9sD1qs3EUg5OqirhhyWE0cKLdI7zCD/SD5
                vot2do0pM2M6SzfloVZ1pCmNQUxVuZ+peUtIfzKL3hhZ8xCkaezw0OgqocEtl8YKhCbXNpxdt3Ej
                48KEuYatr46/t4Dp8OhoNGrKz2Fu0WzphYZSRqaKW/q6+Pt7w8PhaOQPXj9RYG/gDwbrvAY8gwqB
                Gf4/RmYE9nQjoynPQubo9PR0w9j/V2AOByevB53AGMozgNkbDjZNfR737wqY4XDYPZcM5SUDc3h4
                vAUYoLxkYI70Ga4TGKC8ZGBGo9dbgAHKSwbm+PjNFmCA8pKBOTk53QIMUF4yMK/fbFmuNeUlA/Pm
                tHuDZyi/a2AaZ4j2uSZGmNFlZg+I5krikivM9IVExwiBvmU3f3w4OjK7+W65P2RzmU86rKgPP+Vx
                x4ksOFcPnMcAK85kjmHkR174vT2BgeERK2IiUUzM1bxEKsEKpXiF5gTJYn5F4OyuOEo4i2VzJHHY
                Gk49AKjoA5yBsTxbN6DvOuHubh6APwjBhaHZ0/nu1F1h6y6usUBwCkczVF1187hgpPddx7H8uwP0
                8y/7EyMIQn59Qt9k1yd04F8Umbn7QL09E/cHaE/fHe6juwqDkuCv2TJDShRk0sVTGjRDC8xkg6Nm
                1fr9JVG96n7011zw21Vg7jXcfa4MPPQDgn3d8BC+vaCaqQfoTtGU8EKNjwbwc7/f8D9CPpyVs15t
                liAy55kkTYtao65mxAzgmzyBy+n09bPUVgGlp4uLvxmEZZoXilw2Wnst1eC6DWXO7QsuPuAoaYvU
                HuzZpi5DjSJ764fdvUM9NHDGWau10rZp3n2rre2ACCsYZ4cHNsdVxUvN1NbdgKRS+dB4W9YLogpR
                JT1/bm2eogF6C3/jNqXu/r6j4y4fVs5r9axnbisEIF+vm9d27vO82tK+Vv0B5fpV8JxxrHotGw/Q
                cNCBcwdsTZVNZFxpE6Hao0R/tofdnUtaqaLF6BLKesZxEEuFVaEnpenPt9XQ+HetaYw8mze8TS16
                Ilc6TOVtswKy+p6dgEetijUNkGclZ8Q3Ej3HWmJIYqQTmR0EZLKxqWu1+xvBZsJ9R6fuBWVKp22I
                uBR/JFI2cnVPo7qzY31UtdIMYrMkOZpre4tMAVLSZyVgYe7t+/CdwhfsiRiGKPYO4NfbB0uzgrEJ
                6LiHDz2expPq2hVyVaoKzVdTvUgS0XxnhZVvnVgTgFQ+Wphi9313423oz/Zt6Dfk7sg35La80j0g
                sf2t7gGhb3ux+2aFD73bPa4UkkyRynW9XniuWx9R0HjNp4qkOLcgQQX9FeePSK89srlXkvVXU719
                chHQeE3m+cruPv+DLtyw0RljyDRLvRDruRb75l3MBpIT1/+gobzmkP6uWxBMQ9gSP9sFHlJYLPW/
                a/w6Z+b5u83SbZF77LazBOZIYDa0U/PvG+F/AU8aGe42IwAA
              isTopLevelWindow: true
            browserType:
              $type: SingleBrowserType
              typeValue: 3
          browserOutputProvider:
            msgOutputProviders:
            - $type: HttpMessageOutputProvider
              name: https://parabank.parasoft.com/parabank/login.htm
              unparsedPostData: username=john&password=demo
              httpMethod:
                values:
                - $type: ScriptedValue
                fixedValue:
                  $type: HTTPMethodTestValue
                  method: POST
              accept: "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9"
              referer: https://parabank.parasoft.com/parabank/index.htm;jsessionid=7B4BF291078062091FF9A946395A33D2
              contentType: application/x-www-form-urlencoded
              baseUrl: https://parabank.parasoft.com/parabank/login.htm
              hasPostData: true
              postData:
                properties:
                - name: username
                  value:
                    fixedValue:
                      $type: StringTestValue
                      value: john
                - name: password
                  value:
                    fixedValue:
                      $type: StringTestValue
                      value: demo
              requestHeader:
                $type: HTTPNamedToolOutputProvider
                menuName: Header
                name: Request Header of https://parabank.parasoft.com/parabank/login.htm
              requestBody:
                $type: HTTPNamedToolOutputProvider
                menuName: Body
                name: Request Body of https://parabank.parasoft.com/parabank/login.htm
              requestStub:
                $type: StubToolOutputProvider
                menuName: Configure Request
                name: Configure Request for https://parabank.parasoft.com/parabank/login.htm
              responseHeader:
                $type: HTTPNamedToolOutputProvider
                menuName: Header
                name: Response Header of https://parabank.parasoft.com/parabank/login.htm
              responseBody:
                $type: MIMESpecificNamedToolOutputProvider
                menuName: Body
                name: Response Body of https://parabank.parasoft.com/parabank/login.htm
                type: text/html
              responseStub:
                $type: StubToolOutputProvider
                menuName: Stub Request/Response
                name: Stub Request/Response for https://parabank.parasoft.com/parabank/login.htm
              trafficObject:
                $type: ObjectOutputProvider
                menuName: Traffic Object
                name: Traffic Object for https://parabank.parasoft.com/parabank/login.htm
            - $type: HttpMessageOutputProvider
              name: https://parabank.parasoft.com/parabank/overview.htm
              httpMethod:
                values:
                - $type: ScriptedValue
                fixedValue:
                  $type: HTTPMethodTestValue
                  method: GET
              accept: "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9"
              referer: https://parabank.parasoft.com/parabank/index.htm;jsessionid=7B4BF291078062091FF9A946395A33D2
              baseUrl: https://parabank.parasoft.com/parabank/overview.htm
              requestHeader:
                $type: HTTPNamedToolOutputProvider
                menuName: Header
                name: Request Header of https://parabank.parasoft.com/parabank/overview.htm
              requestBody:
                $type: HTTPNamedToolOutputProvider
                menuName: Body
                name: Request Body of https://parabank.parasoft.com/parabank/overview.htm
              requestStub:
                $type: StubToolOutputProvider
                menuName: Configure Request
                name: Configure Request for https://parabank.parasoft.com/parabank/overview.htm
              responseHeader:
                $type: HTTPNamedToolOutputProvider
                menuName: Header
                name: Response Header of https://parabank.parasoft.com/parabank/overview.htm
              responseBody:
                $type: MIMESpecificNamedToolOutputProvider
                menuName: Body
                name: Response Body of https://parabank.parasoft.com/parabank/overview.htm
                type: text/html
              responseStub:
                $type: StubToolOutputProvider
                menuName: Stub Request/Response
                name: Stub Request/Response for https://parabank.parasoft.com/parabank/overview.htm
              trafficObject:
                $type: ObjectOutputProvider
                menuName: Traffic Object
                name: Traffic Object for https://parabank.parasoft.com/parabank/overview.htm
            - $type: HttpMessageOutputProvider
              name: https://parabank.parasoft.com/parabank/services_proxy/bank/customers/12212/accounts
              httpMethod:
                values:
                - $type: ScriptedValue
                fixedValue:
                  $type: HTTPMethodTestValue
                  method: GET
              accept: "application/json, text/plain, */*"
              referer: https://parabank.parasoft.com/parabank/overview.htm
              baseUrl: https://parabank.parasoft.com/parabank/services_proxy/bank/customers/12212/accounts
              requestHeader:
                $type: HTTPNamedToolOutputProvider
                menuName: Header
                name: Request Header of https://parabank.parasoft.com/parabank/services_proxy/bank/customers/12212/accounts
              requestBody:
                $type: HTTPNamedToolOutputProvider
                menuName: Body
                name: Request Body of https://parabank.parasoft.com/parabank/services_proxy/bank/customers/12212/accounts
              requestStub:
                $type: StubToolOutputProvider
                menuName: Configure Request
                name: Configure Request for https://parabank.parasoft.com/parabank/services_proxy/bank/customers/12212/accounts
              responseHeader:
                $type: HTTPNamedToolOutputProvider
                menuName: Header
                name: Response Header of https://parabank.parasoft.com/parabank/services_proxy/bank/customers/12212/accounts
              responseBody:
                $type: MIMESpecificNamedToolOutputProvider
                menuName: Body
                name: Response Body of https://parabank.parasoft.com/parabank/services_proxy/bank/customers/12212/accounts
                type: text/html
              responseStub:
                $type: StubToolOutputProvider
                menuName: Stub Request/Response
                name: Stub Request/Response for https://parabank.parasoft.com/parabank/services_proxy/bank/customers/12212/accounts
              trafficObject:
                $type: ObjectOutputProvider
                menuName: Traffic Object
                name: Traffic Object for https://parabank.parasoft.com/parabank/services_proxy/bank/customers/12212/accounts
            contents:
              $type: BrowserContentsOutputProvider
              outputTools:
              - $type: BrowserContentsViewer
                dataSourceNames:
                - Bank Data API
                iconName: BrowserContentsViewer
                name: Browser Contents Viewer
              name: Browser Contents
            traffic:
              $type: NamedToolOutputProvider
              outputTools:
              - $type: TrafficViewer
                iconName: TrafficViewer
                name: Traffic Viewer
                showRequestHeaders: true
                showResponseHeaders: true
              name: HTTP Traffic
      - $type: TestSuite
        testLogic: true
        testFlowLogic:
          condition: true
        testID: 425
        enabled: true
        name: Validations
        browserOptions:
          browserType:
            useDefault: false
            type:
              $type: SingleBrowserType
              typeValue: 3
        profileMappingID: 0
        maxProfileMappingID: 1
        testSuiteLogic: true
        testLogicVariables:
        - $type: TestLogicString
          name: UIXPath_Balance
          value:
            $type: TestLogicVariableString
            originalValue: 0
            value: 0
        - $type: TestLogicString
          name: UIXPath_AccountIds
          value:
            $type: TestLogicVariableString
            originalValue: 0
            value: 0
        nextIdentifier: 1
        runMode: 1
        tests:
        - $type: BrowserTest
          testLogic: true
          testFlowLogic:
            condition: true
          testID: 486
          enabled: true
          name: Browser Playback Tool
          tool:
            $type: BrowserTestingTool
            dataSourceNames:
            - Bank Data API
            iconName: BrowserTest
            name: Iterate Over Web Table
            commands:
            - windowIdentifier:
                BrowserTestingTool_WindowName: ""
                BrowserTestingTool_WindowIndex: 0
              action:
                $type: WaitAction
                inputData:
                  values:
                  - $type: ScriptedValue
                  fixedValue:
                    $type: StringTestValue
                    value: 0
            delaySettings:
              delays:
              - $type: ElementDelay
                windowIdentifier:
                  WindowName: ""
                elementState: 1
                specifiedLocator:
                  criteria:
                    $type: AttributeCriteria
                    elementName: any
                    attributeName: ""
            originalCommand: true
            command:
              windowIdentifier:
                BrowserTestingTool_WindowName: ""
              action:
                $type: UnknownAction
                location:
                  criteria:
                    $type: AttributeCriteria
                    elementName: any
                    attributeName: id
                action: ""
            browserContents: true
            contents:
              windowContents:
              - parentUrl: ""
                charSet: windows-1252
                url: https://parabank.parasoft.com/parabank/overview.htm
                htmlSize: 2202
                html: !!binary |-
                  H4sIAAAAAAAA/+Va63LbuBX+bT8FwvF05V2LlGzZiXVh6qTxdDtp49k47XS2OzsQCYlwQIIFQNsa
                  rx+ob9kDECApivIlf7od22MJwLkA5zsHBzdPX/3p0/vLf158QIlKWbg7NV/ThOA4nEq1YgSpVU5m
                  niK3Koik9MI/RgkWkijkfbk877/xJj9ny3+NI8bx118OoNx3xRgr3G/UbxsV3xUP/LrZtCY0JuOM
                  q56r9HFGU6zI/l1MZc7wCqgZQa9omnOhcKYm93oACy7SimPOePR1cq9VWOm+TGh6d00lnVNG1WoM
                  qmOSOZ4o4eIu55IqyrMxnkvOCkUm99PAgBDu7uxMU6IwssbPrPE1IVEq75N/F/R65r3nmSKZ6l8C
                  dB6KyprFUAM8qdQ0tCiqoKMLLPA7nH1Fv6GzKOJFpiT6dE3ENSU306Dk0dyMAk8iyGLmBTnIzEEm
                  UCQF8xXxtaOQIGzmmeHLhBDlbXhyqx4j9AwlMhI0V0iKqKnlhsyvwMoAZ8uCYXElg6F/4p+6up/S
                  zL8CDYCxkQdV08BE3i6U5jxeGeUxvUY0nnkpptkFzggzfe7ov8bHzi78VLyK544VoSneMBDHunNw
                  BfRO02V75BAxSyKDiBEY5pIuPHRDY5XMvOMTDyWELhPw5ujQQ3MuYiJm3gC8zLCUM89o1jbhLV3T
                  LCa3j3bN+JKXPWMGfbmoqAYyPGqM5GjYNRKtAtylI6ahoBpZ7vginOug98IPtzkRlGQRzPmEoJgu
                  FkTo6jTIITMEAG5YQ6wdRUSJMjIBMvPmOPq6FBC08RgVgvU2zCqF+lEhFU+J8K/y5T4awG/G+4Lk
                  BKuJcZn2ZcEqS8hCpSQrSm8y6to/60kKQ4cYqorTgFHLFlbo4zkvVIn5mS6iL1LD0Mkr9VyLiCzZ
                  P9vaVnY97cdBcHNz42tjJV8oP+JpcCXzIBc8LiIlIcpzL7ywtW9UFeg0gittH3mErcFb1DVi/EwX
                  0QW4oMkNLi3YJtrzQikdDutYJ+AvL3w4njVPazjVtNCwF9Lr9IkpbhG0VjcEbUspaiu1cGmTDVaX
                  HfRfFbg6sTTySE3QYdYk2MTS+tKJpp48MsWMXUIyhAHOw38QFhkM5iH6C08y9DmlKjHTB1bWw9Bm
                  dFRHFTTulvBv+K+GmOckw6VoafUnaEB/IzduidgaAw0ddg2xAbG5tDyqQQmcScgIpYZLW0PnMNu3
                  B2EtDssuy/GqlH4HFYjH1RPkFhBgputS8hyqyHQObn8w/msVRQ5bEQKzcUFhWTNqvpgm9L4MH/Rj
                  tuBPUCRgfSdSwV7FTqyfygb0EVqeIK9Tsgv6j3yJPhUbkduMtTI861CuIlXovL8eqnbx05uZPJ95
                  zq/O0Wd57mmini+CM6aXijbPeyVYtXoAr4wg8Mo88KrfB+kfF2MkE37jBFG/H7peqU6dDVq3IlCV
                  DB3FLE2dsZgMLbPCc9iBapNt/F/qhkr3UuCY6o2WWX9sD1qs3EUg5OqirhhyWE0cKLdI7zCD/SD5
                  vot2do0pM2M6SzfloVZ1pCmNQUxVuZ+peUtIfzKL3hhZ8xCkaezw0OgqocEtl8YKhCbXNpxdt3Ej
                  48KEuYatr46/t4Dp8OhoNGrKz2Fu0WzphYZSRqaKW/q6+Pt7w8PhaOQPXj9RYG/gDwbrvAY8gwqB
                  Gf4/RmYE9nQjoynPQubo9PR0w9j/V2AOByevB53AGMozgNkbDjZNfR737wqY4XDYPZcM5SUDc3h4
                  vAUYoLxkYI70Ga4TGKC8ZGBGo9dbgAHKSwbm+PjNFmCA8pKBOTk53QIMUF4yMK/fbFmuNeUlA/Pm
                  tHuDZyi/a2AaZ4j2uSZGmNFlZg+I5krikivM9IVExwiBvmU3f3w4OjK7+W65P2RzmU86rKgPP+Vx
                  x4ksOFcPnMcAK85kjmHkR174vT2BgeERK2IiUUzM1bxEKsEKpXiF5gTJYn5F4OyuOEo4i2VzJHHY
                  Gk49AKjoA5yBsTxbN6DvOuHubh6APwjBhaHZ0/nu1F1h6y6usUBwCkczVF1187hgpPddx7H8uwP0
                  8y/7EyMIQn59Qt9k1yd04F8Umbn7QL09E/cHaE/fHe6juwqDkuCv2TJDShRk0sVTGjRDC8xkg6Nm
                  1fr9JVG96n7011zw21Vg7jXcfa4MPPQDgn3d8BC+vaCaqQfoTtGU8EKNjwbwc7/f8D9CPpyVs15t
                  liAy55kkTYtao65mxAzgmzyBy+n09bPUVgGlp4uLvxmEZZoXilw2Wnst1eC6DWXO7QsuPuAoaYvU
                  HuzZpi5DjSJ764fdvUM9NHDGWau10rZp3n2rre2ACCsYZ4cHNsdVxUvN1NbdgKRS+dB4W9YLogpR
                  JT1/bm2eogF6C3/jNqXu/r6j4y4fVs5r9axnbisEIF+vm9d27vO82tK+Vv0B5fpV8JxxrHotGw/Q
                  cNCBcwdsTZVNZFxpE6Hao0R/tofdnUtaqaLF6BLKesZxEEuFVaEnpenPt9XQ+HetaYw8mze8TS16
                  Ilc6TOVtswKy+p6dgEetijUNkGclZ8Q3Ej3HWmJIYqQTmR0EZLKxqWu1+xvBZsJ9R6fuBWVKp22I
                  uBR/JFI2cnVPo7qzY31UtdIMYrMkOZpre4tMAVLSZyVgYe7t+/CdwhfsiRiGKPYO4NfbB0uzgrEJ
                  6LiHDz2expPq2hVyVaoKzVdTvUgS0XxnhZVvnVgTgFQ+Wphi9313423oz/Zt6Dfk7sg35La80j0g
                  sf2t7gGhb3ux+2aFD73bPa4UkkyRynW9XniuWx9R0HjNp4qkOLcgQQX9FeePSK89srlXkvVXU719
                  chHQeE3m+cruPv+DLtyw0RljyDRLvRDruRb75l3MBpIT1/+gobzmkP6uWxBMQ9gSP9sFHlJYLPW/
                  a/w6Z+b5u83SbZF77LazBOZIYDa0U/PvG+F/AU8aGe42IwAA
                isTopLevelWindow: true
              browserType:
                $type: SingleBrowserType
                typeValue: 3
            browserOutputProvider:
              contents:
                $type: BrowserContentsOutputProvider
                outputTools:
                - $type: BrowserContentsViewer
                  dataSourceNames:
                  - Bank Data API
                  iconName: BrowserContentsViewer
                  name: Browser Contents Viewer
                - $type: BrowserValidationTool
                  dataSourceNames:
                  - Bank Data API
                  iconName: BrowserValidation
                  name: Browser Validation Tool
                  extractions:
                  - $type: BrowserTestExtraction
                    elementOption: 1
                    contentOption: 1
                    xPath: "//TR[1]/TD[1]/A"
                    mode: 1
                    column:
                      customName: "Test 2: 12345"
                    validationMessage: "Validate ${Bank Data API: API_AccountIds}\
                      \ - Validation failed for property \"text[1]\": Actual value\
                      \ found on the page \"${ActualValue}\" must be equal to expected\
                      \ value \"${ExpectedValue}\"."
                    name: "Validate ${Bank Data API: API_AccountIds}"
                    boundaryValue: true
                    boundaryValueObj:
                      $type: ExtractedTestValue
                      leftBoundary: ""
                      rightBoundary: ""
                    validate: true
                    elementName: A
                    propertyName: "text[1]"
                    origValue: 12345
                    expectedValue:
                      values:
                      - $type: ScriptedValue
                      fixedValue:
                        $type: StringTestValue
                        BrowserValidationTool_ExpectedValue: 12345
                      parameterizedValue:
                        column: "Bank Data API: API_AccountIds"
                      selectedIndex: -2
                    windowIdentifier:
                      BrowserValidationTool_WindowName: ""
                      BrowserValidationTool_WindowIndex: 0
                    locator:
                      criteria:
                        $type: ScriptCriteria
                        method:
                          hasCode: true
                          code:
                            $type: ScriptCode
                            input:
                              useText: true
                              textInput:
                                $type: ScriptingTextInput
                                text: "import com.parasoft.api.*\r\n\r\npublic String\
                                  \ calculateXPath(input,context) {\r\n\treturn \"\
                                  //TR[\"+String.valueOf(context.getDataSourceRowIndex())+\"\
                                  ]/TD[1]/A\"\r\n}"
                          hasMethodId: true
                          methodId:
                            $type: ScriptMethodIdentifier
                            functionName: calculateXPath
                            arguments:
                            - java.lang.Object
                            - java.lang.Object
                          useDataSource: true
                  - $type: BrowserTestExtraction
                    elementOption: 1
                    contentOption: 1
                    xPath: "//TR[1]/TD[2]"
                    mode: 1
                    column:
                      customName: "Test 2: 2400.00"
                    validationMessage: "Validate ${Bank Data API: API_Balance} - Validation\
                      \ failed for property \"text[1]\": Actual value found on the\
                      \ page \"${ActualValue}\" must be equal to expected value \"\
                      ${ExpectedValue}\"."
                    name: "Validate ${Bank Data API: API_Balance}"
                    boundaryValue: true
                    boundaryValueObj:
                      $type: ExtractedTestValue
                      isLeftRegex: true
                      leftBoundary: "[$]"
                      rightBoundary: ""
                    validate: true
                    elementName: TD
                    propertyName: "text[1]"
                    origValue: -$2400.00
                    expectedValue:
                      values:
                      - $type: ScriptedValue
                        method:
                          hasCode: true
                          code:
                            $type: ScriptCode
                            input:
                              useText: true
                              textInput:
                                $type: ScriptingTextInput
                                text: "import com.parasoft.api.*\r\n\r\npublic Boolean\
                                  \ compareBalance(input,context) {\r\n\tString actualValue\
                                  \ = context.getActualValue().replace(\"\\$\",\"\"\
                                  );\r\n\tString expectedValue = context.getValue(\"\
                                  Bank Data API\", \"Bank Data API: API_Balance\"\
                                  );\r\n\t\r\n\tif(actualValue.equals(expectedValue))\
                                  \ {\r\n\t\treturn true;\r\n\t}\r\n\telse {\r\n\t\
                                  \treturn false;\r\n\t}\r\n}"
                          hasMethodId: true
                          methodId:
                            $type: ScriptMethodIdentifier
                            functionName: compareBalance
                            arguments:
                            - java.lang.Object
                            - java.lang.Object
                          useDataSource: true
                      fixedValue:
                        $type: StringTestValue
                        BrowserValidationTool_ExpectedValue: 2400.00
                      parameterizedValue:
                        column: "Bank Data API: API_Balance"
                      selectedIndex: 0
                    windowIdentifier:
                      BrowserValidationTool_WindowName: ""
                      BrowserValidationTool_WindowIndex: 0
                    locator:
                      criteria:
                        $type: ScriptCriteria
                        method:
                          hasCode: true
                          code:
                            $type: ScriptCode
                            input:
                              useText: true
                              textInput:
                                $type: ScriptingTextInput
                                text: "import com.parasoft.api.*\r\n\r\npublic String\
                                  \ calculateXPath(input,context) {\r\n\treturn \"\
                                  //TR[\"+String.valueOf(context.getDataSourceRowIndex())+\"\
                                  ]/TD[2]\"\r\n}"
                          hasMethodId: true
                          methodId:
                            $type: ScriptMethodIdentifier
                            functionName: calculateXPath
                            arguments:
                            - java.lang.Object
                            - java.lang.Object
                          useDataSource: true
                name: Browser Contents
              traffic:
                $type: NamedToolOutputProvider
                outputTools:
                - $type: TrafficViewer
                  iconName: TrafficViewer
                  name: Traffic Viewer
                  showRequestHeaders: true
                  showResponseHeaders: true
                name: HTTP Traffic
      - $type: BrowserTest
        testLogic: true
        testFlowLogic:
          condition: true
        testID: 427
        enabled: true
        name: Browser Playback Tool
        tool:
          $type: BrowserTestingTool
          dataSourceNames:
          - Accounts
          usesAutomaticallyGeneratedName: true
          iconName: BrowserTest
          name: Browser Playback Tool
          commands:
          - windowIdentifier:
              BrowserTestingTool_WindowName: ""
              BrowserTestingTool_WindowIndex: 0
            action:
              $type: CloseAction
          delaySettings:
            delays:
            - $type: ElementDelay
              windowIdentifier:
                WindowName: ""
              elementState: 1
              specifiedLocator:
                criteria:
                  $type: AttributeCriteria
                  elementName: any
                  attributeName: ""
          originalCommand: true
          command:
            windowIdentifier:
              BrowserTestingTool_WindowName: ""
            action:
              $type: UnknownAction
              location:
                criteria:
                  $type: AttributeCriteria
                  elementName: any
                  attributeName: id
              action: ""
          browserContents: true
          contents:
            windowContents:
            - parentUrl: ""
              url: ""
              htmlSize: 20
              html: !!binary |-
                H4sIAAAAAAAA/wMAAAAAAAAAAAA=
              isTopLevelWindow: true
            browserType:
              $type: SingleBrowserType
              typeValue: 3
          browserOutputProvider:
            contents:
              $type: BrowserContentsOutputProvider
              outputTools:
              - $type: BrowserContentsViewer
                iconName: BrowserContentsViewer
                name: Browser Contents Viewer
              name: Browser Contents
            traffic:
              $type: NamedToolOutputProvider
              outputTools:
              - $type: TrafficViewer
                iconName: TrafficViewer
                name: Traffic Viewer
                showRequestHeaders: true
                showResponseHeaders: true
              name: HTTP Traffic
