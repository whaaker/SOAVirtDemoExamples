---
parasoftVersion: 2024.2.0
productVersion: 10.7.1
schemaVersion: 1
suite:
  $type: TestSuite
  hasEnvironmentConfig: true
  environmentConfig:
    environments:
    - $type: EnvironmentReference
      name: Parabank Environments
      location: true
      locationObj:
        path: ..\Parabank_Rest_Environments.envs
      activeEnvironmentName: qa1.parasoft.com
  enabled: true
  name: login
  rootTestSuite: true
  lastModifiedBy: whaaker
  profileMappingID: 0
  maxProfileMappingID: 1
  testLogicVariables:
  - $type: TestLogicDataSource
    name: username
    value:
      $type: TestLogicVariableDataSource
      dataSourceName: New Datasource
      columnName: username
      defaultValue: 0
  - $type: TestLogicDataSource
    name: password
    value:
      $type: TestLogicVariableDataSource
      dataSourceName: New Datasource
      columnName: password
      defaultValue: 0
  nextIdentifier: 17
  tests:
  - $type: RESTClientToolTest
    testLogic: true
    testFlowLogic:
      condition: true
    testID: 2
    enabled: true
    name: "/login/{username}/{password} - GET"
    performanceGroup: 16
    tool:
      $type: RESTClient
      iconName: RESTClient
      name: "/login/{username}/{password} - GET"
      outputTools:
      - $type: XMLtoDataSource
        allowToolbar: false
        iconName: XMLDataBank
        name: XML Data Bank
        selectedXPaths:
        - elementOption: 1
          contentOption: 1
          XMLDataBank_ExtractXPath: "/customer/id[1]/text()"
          mode: 1
        xmlMessage: true
        virtualDSCreator:
          writableColumns:
          - testVariableName: username
            customName: extractedCustomerId
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
          location: http://192.168.56.101:8080/parabank/services/bank?_wadl&_type=xml
        serviceName: ""
        versionName: ""
      jsonBuilder:
        hasValue: true
        value:
          $type: JSONObjectValue
          nameIsNull: true
      schemaURL:
        MessagingClient_SchemaLocation: "${WADL}"
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
          HTTPClient_Endpoint: "${BASEURL}/login/${username}/${password}"
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
          name: Traffic Object
      literal:
        use: 1
        text:
          MessagingClient_LiteralMessage: ""
          type: application/json
        dataSource:
          columnName: password
      mode: Literal
      literalQuery:
        isPropertiesRef: true
      literalPath:
        pathElements:
        - values:
          - $type: ScriptedValue
          fixedValue:
            $type: StringTestValue
            value: login
        - values:
          - $type: ScriptedValue
          fixedValue:
            $type: StringTestValue
          parameterizedValue:
            column: username
          selectedIndex: -2
        - values:
          - $type: ScriptedValue
          fixedValue:
            $type: StringTestValue
          parameterizedValue:
            column: password
          selectedIndex: -2
      constrainedPath:
        pathParameters:
        - $type: ElementValue
          writeType: true
          type:
            $type: ElementType
            hash: 1
            localName: username
            bodyType:
              $type: StringType
              hash: 2
          replacedColumn: ""
          values:
          - $type: StringValue
            replacedColumn: ""
            mode: 3
            columnName: username
            value: ""
            xmlEncoding: 2
        - $type: ElementValue
          writeType: true
          type:
            $type: ElementType
            hash: 1
            localName: password
            bodyType:
              $type: StringType
              hash: 2
          replacedColumn: ""
          values:
          - $type: StringValue
            replacedColumn: ""
            mode: 3
            columnName: password
            value: ""
            xmlEncoding: 2
      resourceMethod:
        resourceId: "/login/{username}/{password}"
        httpMethod: GET
      baseUrl:
        values:
        - $type: ScriptedValue
        - $type: WadlTestValue
          value: http://192.168.56.101:8080/parabank/services/bank
        fixedValue:
          $type: StringTestValue
          value: "${BASEURL}"
