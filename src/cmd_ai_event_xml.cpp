#include "xml_support.h"
#include "cmd_ai_event_xml.h"
#include <string>
#include <vector>
#include <list>
#include <float.h>

//serves to run through a XML file that nests things for "and". 



using XMLSupport::EnumMap;
using XMLSupport::Attribute;
using XMLSupport::AttributeList;
using XMLSupport::parse_float;
using XMLSupport::parse_bool;
using XMLSupport::parse_int;
namespace AIEvents {

  const int  AIUNKNOWN=0;
  const int AIMIN =1;	
  const int AIMAX =2;
  const int AISCRIPT =3;
  const int AINOT=4;
  const XMLSupport::EnumMap::Pair AIattribute_names[] = {
    EnumMap::Pair ("UNKNOWN", AIUNKNOWN),
    EnumMap::Pair ("min", AIMIN), 
    EnumMap::Pair ("max", AIMAX),
    EnumMap::Pair ("not", AINOT),
    EnumMap::Pair ("Script", AISCRIPT)
  };
  const XMLSupport::EnumMap attr_map(AIattribute_names, 4);

  void GeneralAIEventBegin (void *userData, const XML_Char *name, const XML_Char **atts) {
    AttributeList attributes (atts);
    string aiscriptname ("default_behavior.xml");
    float min= -FLT_MAX; float max=FLT_MAX;
    ElemAttrMap * eam = ((ElemAttrMap *)userData);
    int elem = eam->element_map.lookup(name);
    AttributeList::const_iterator iter;
    eam->level++;
    if (elem==0) {

    }else {
      assert (eam->level!=1);//might not have a back on result();
      if (eam->level==2) 
	eam->result.push_back(std::list<AIEvresult>());

      for(iter = attributes.begin(); iter!=attributes.end(); iter++) {
	switch(attr_map.lookup((*iter).name)) {
	case AINOT:
	  elem = -elem;//since elem can't be 0 (see above) this will save the "not" info
	  break;
	case AIMIN:
	  min=parse_float((*iter).value);
	  break;
	case AIMAX:
	  max = parse_float ((*iter).value);
	  break;
	case AISCRIPT:
	  aiscriptname = (*iter).value;
	default: 
	  break;
	}
      }
      eam->result.back().push_back (AIEvresult(elem, min,max,aiscriptname));
    }
  }  

  void GeneralAIEventEnd (void *userData, const XML_Char *name) {
    ((ElemAttrMap *)userData)->level--;    
    
  }  
  void LoadAI(const char * filename, ElemAttrMap &result) {
    const int chunk_size = 16384;
    FILE * inFile = fopen (filename, "r+b");
    if(!inFile) {
      assert(0);
      return;
    }	
    XML_Parser parser = XML_ParserCreate (NULL);
    XML_SetUserData (parser, &result);
    XML_SetElementHandler (parser, &GeneralAIEventBegin, &GeneralAIEventEnd);
    do {
      char *buf = (XML_Char*)XML_GetBuffer(parser, chunk_size);
      int length;    
      length = fread (buf,1, chunk_size,inFile);
      XML_ParseBuffer(parser, length, feof(inFile));
    } while(!feof(inFile));
    fclose (inFile);
    assert (result.level==0);
    result.level =0;
      
  }


}
