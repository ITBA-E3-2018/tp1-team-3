#include <cstdint>
#include <iostream>
#include <string>
#include <cmath>
#include "parseCmdLine/parseCmdLine.h"

#define ERRORMSG "ERROR"
#define MAX_SIZE_INT    127
#define MAX_SIZE_FRAC   127

#define DEBUG 1 // 1 para tests, 0 para programa normal


typedef struct {    
    bool sign;
    uint8_t sizeInt;
    uint8_t sizeFrac;
    uint8_t nArgs;
    //0: nada, 1: solo sign, 2: sign y sizeInt, 3: todo, >=3: error
} parserData_t ;


int parserCallback (char * key, char * value, void * userData);
void fixedPoint(uint8_t sizeInt, uint8_t sizeFrac, float& res, float& ran);


#if DEBUG == 1
int mainresran(int argc, char * argv []);

int main () {
   
    char * test[14][4]  = {
        {"bad arguments", "dont", "write--", "909WORDS!"},
        {"bad sign", "2", "4", "4"},
        {"negative size int", "1", "-4", "3"},
        {"negative size frac", "0", "8", "-1"}, 
        {"negative sign", "-55", "4", "5"},
        {"float in size int", "0", "4.4", "3"},
        {"float in size frac", "1", "8", "1.5"}, 
        {"too large size int", "0", "128", "5"},
        {"too large size frac", "1", "2", "128"},
        {"all zeros", "0", "0", "0"},
        {"largest size", "1", "127", "127"},
        {"zero int", "0", "0", "21"},
        {"zero frac", "1", "12", "0"},
        {"regular input", "0", "2", "1"},
    };
    
    unsigned int ntests = sizeof(test)/(4*sizeof(char*));
    for (unsigned int i = 0; i < ntests; i++) {
        std::cout << "Testing: " << test[i][0] << std::endl;
        mainresran(4, test[i]);
        std::cout << std::endl;
    }
    
    std::cout << "Testing: missing arguments" << std::endl;
    mainresran(3, test[12]);
    std::cout << std::endl;

    std::cout << "Testing: too many arguments" << std::endl;    
    char * thefinaltest[] = {"way too many", "1", "2", "3", "y u do dis"};
    mainresran(5, thefinaltest);
    std::cout << std::endl;
    
    std::cout << "Tests completed. Press any key to continue." << std:: endl;
    std::cin.get();
}


int mainresran(int argc, char * argv [])
#else
int main(int argc, char * argv[])
#endif
{
    parserData_t data; data.nArgs = 0;

    if (parseCmdLine(argc, argv, parserCallback, &data) == 3) {
        float res, ran;
        fixedPoint(data.sizeInt, data.sizeFrac, res, ran);
        std::cout.precision(5);
        std::cout   << "Res: " << res
                    << " | Ran: " << ran;
    }
    else {
        std::cout << ERRORMSG;
    }
    
    
    std::cout << std::endl;
    return 0;
}



void fixedPoint(uint8_t sizeInt, uint8_t sizeFrac, float& res, float& ran) {
    res = std::pow(2, -sizeFrac); 
    ran = std::pow(2, sizeInt) - res;   
}

int parserCallback (char * key, char * value, void * userData) 
{
    parserData_t * data = (parserData_t *)userData;
    bool good = false;
    
    if (key == nullptr && value != nullptr && data != nullptr) {
        unsigned int i = 0;
        while (value[i] != 0 && std::isdigit(value[i])) {
            i++;
        }
        
        if (value[i] == 0) {
            unsigned int numvalue = atoi(value); 
            switch (data->nArgs) {
                case 0: {   
                    if (numvalue<=1) {
                    data-> sign = (numvalue == 1);
                    good = true;
                    }
                } break;
            
                case 1: {
                    if (numvalue<=MAX_SIZE_INT) {
                        data->sizeInt = uint8_t(numvalue);
                        good = true;
                    }
                } break;

                case 2: {
                    if (numvalue<=MAX_SIZE_FRAC && !(numvalue == 0 && data->sizeInt== 0)) {
                        data->sizeFrac = uint8_t(numvalue);
                        good = true;
                    }
                } break;
            }
            data->nArgs++;
        }
    }

    return good;
}