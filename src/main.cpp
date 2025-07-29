#include <iostream>
#include "encoder.h"
#include "decoder.h"


int main(){

	std::string a,sEncoded;
	int key;
	std::cin>>a>>key;
	sEncoded = encode(a,key);
	std::cout<<"Encoded text is: "<<sEncoded<<std::endl;
	
	std::cout<<"Decoded text is: "<<decode(sEncoded,key)<<std::endl;
}
