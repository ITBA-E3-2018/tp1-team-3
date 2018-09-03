#include <cstdint>
#include <iostream>
#include <string>
#include <cmath>
#include "parseCmdLine/parseCmdLine.h"

#define ERRORMSG "ERROR"


typedef struct {    
    bool sign;
    uint8_t sizeInt;
    uint8_t sizeFrac;
    uint8_t nArgs;
    //0: nada, 1: solo sign, 2: sign y sizeInt, 3: todo, >=3: error
} parserData_t ;

int parserCallback (char * key, char * value, void * userData);
void fixedPoint(uint8_t sizeInt, uint8_t sizeFrac, float& res, float& ran);

/*int main () {
    parserData_t data;						//estructura donde el callback guardara lo que reciba del parser
    char * test[] = {"hola", "que", "hace");
    

}*/


int main(int argc, char * argv [])
//int main()
{
/*    float res, ran;
    fixedPoint(1,1, res, ran);
    std::cout   << "Res: " << res <<
                    " | Ran: " << ran << std::endl;
*/
    parserData_t data; data.nArgs = 0;
//    int argc = 4; 
//    char * argv[] = {"ahre", "0", "40", "100"};
    if (parseCmdLine(argc, argv, parserCallback, &data) == 3) {
        float res, ran;
        fixedPoint(data.sizeInt, data.sizeFrac, res, ran);
        std::cout.precision(5);
        std::cout   << "Res: " << res <<
                    " | Ran: " << ran << std::endl;
    }
    else {
        std::cout << ERRORMSG << std::endl;
    }
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
        unsigned long numvalue;
        try {
            numvalue = std::stoul(value);    
        }
        catch (...) {
            data->nArgs = 4;
            return good;
        }

        switch (data->nArgs) {
            case 0: {
                if (numvalue<=1) {
                    data-> sign = (numvalue == 1);
                    good = true;
                }
            } break;

            case 1: {
                if (numvalue<=255) {
                    data->sizeInt = uint8_t(numvalue);
                    good = true;
                }
            } break;

            case 2: {
                if (numvalue<=255) {
                    data->sizeFrac = uint8_t(numvalue);
                    good = true;
                }
            } break;
        }
        data->nArgs++;
    }

    return good;
}
/* int main (int argc, char * argv[]) 
{
    if (argc == 3) {
        bool sign; uint8_t sizeInt, sizeFrac;
        if (rangeArgsGood(argv[0], argv[1], argv[2], sign, sizeInt, sizeFrac)){

        }
    }
    
}


bool rangeArgsGood( char * strSign, char * strSizeInt, char * strSizefrac,
                    bool sign, uint8_t sizeInt, uint8_t sizeFrac); */