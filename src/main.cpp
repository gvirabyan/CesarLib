#include <iostream>
#include "encoder.h"
#include "decoder.h"
#include "unit_tester.h"

int main(){

	std::string a,strEncoded;
	int key;
	std::cin>>a>>key;
	
	test_cesar(a,key);
	
	return 0;	
}
