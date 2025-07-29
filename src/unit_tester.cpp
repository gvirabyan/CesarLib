#include <iostream>
#include "unit_tester.h"
#include "encoder.h"
#include "decoder.h"
#include <string>

bool test_cesar(std::string text,int key)
{
	std::string strEncoded = encode(text,key);
	std::string strDecoded = decode(strEncoded,key);
	
	if(text == strDecoded)
	{
		std::cout<<"Cesar working fine)";
		return true;
	}
	else{
		std::cout<<"Have a issue, please fix!";
		return false;
	}

}		 
