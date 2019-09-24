1. XML is parsed (by parser), processed (by Processor), and/ or formatted (XSL or CSS)

2. using XML allow separation of presenation / application

3. PI is a way to embed application-specific information into an XML document
    - PI can be parsed or ignored unlike comment
    - start and end it ?

4. prolog <?xml....> special PI / optional / but if exists, it must be the head line

5. XML Schema
    - set of requirements or constraints to be satisfied by the structure  and contents of an XML document
    - similar to syntax rule

6. Schema Languages
    - Document type definition(DTD)
    - W3C Schema (XSD)
    - RELAX NG (RNG)
    - Schematron
    - As a compiler follows a set of rules to translate high level Languages, 
        XML processor can follow schemas designed with schema Languages to translate XML documents? 

7. What Schemas specify
    - allowed elements (tags)
    - element content models
        - what's allowed between tags
        - hierarchical structure
    - allowed attributes per element
    - data typing of attribute values or element contents

8. Document Type Definition - DTD
    - oldest and (possibly) most common
    - compatible with most processors
    - declarations
    - can be embed with XML / separate
    
    8.0. <!DOCTYPE student_info SYSTEM "studentinfo.dtd">
    HTML seems to be a subset of XML!
    miystery of !DOCTYPE solved ;) 


    8.1. Element declaration 
    <!ELEMENT $elname $contentmodel>
    
    8.1.1. Common content model types
        - specify what type is allowed as contents
            text (#PCDATA) 
                - ()
                - #PCDATA indicates text? 
            Mixed content (#PCDATA | el1 | el2 |le3)*
                - el1, el2, el3 being 
            Element content(no text) {firstname, middlename?, lastname, birthdate, hobby+}
                - list of allowed child elements IN ORDER
                - suffix ? indicate it is optional
                - suffix + like regex, can be one or more
                - suffix * zero or more
            Empty EMPTY without parenthesis (seems like constant)
    8.1.2 Example of using content model
    schema <!ELEMENT foo (a, (b|c), d)>
        <foo>
            <a></a>
            <b></b>
            <d></d>
        </foo>
    
    
    8.2. Attribute declaration

    <!ATTLIST $elem_name 
        att_name1 att_type is_required
        att_name2 att_type is_required
        att_name3 att_type is_required
    >
    - the three fields (name, type, bool) is required

    8.2.1. Example of using !ATTLIST

    ------------------------------------------
    <!-- in studentinfo.dtd-->
    <!ELEMENT name (#PCDATA)>
    <!ELEMENT student_id (#PCDATA)>
    <!ELEMENT student_info (name, student_id)>
    <!-- <!ELEMENT student_info (name | student_id)*-->
    <!ATTLIST student_info 
        status CDATA #REQUIRED 
    >
    above schema enforces / allows below XML
    ------------------------------------------
    <?xml version="1.0"?>
    <!DOCTYPE student_info SYSTEM "studentinfo.dtd">
    <student_info status="part-time">
        <name>Mickey Mouse</name>
        <student_id>12345678</student_id>
    </student_infos>
    ------------------------------------------


