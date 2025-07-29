#include <string>
#include "decoder.h"

std::string decode(std::string text, int key)
{
	
		for (int i = 0; i < text.length(); ++i) {
			char c = text[i];
			if (std::islower(c)) {
				text[i] = (c - 'a' - key ) % 26 + 'a';
			}
			else if (std::isupper(c)) {
				text[i] = (c - 'A' - key) % 26 + 'A';
			}
		}	
	return text;
}
