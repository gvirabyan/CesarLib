#include <iostream>
#include "encoder.h"
#include "decoder.h"


int main(){

	std::string a,sEncoded;
	int key;
	std::cin>>a>>key;
	sEncoded = encode(a,key);
	std::cout<<sEncoded<<std::endl;
	
	std::cout<<decode(sEncoded,5)<<std::endl;
}
