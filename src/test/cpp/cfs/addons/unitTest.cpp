
#include <cstdlib>
#include <cfs/addons/Test.hpp>

int
main(int argc, char * argv[])
{
    cfs::com::test::Test cfscomTest;
    cfscomTest.run(argc,argv);

    return ( EXIT_SUCCESS );

}
