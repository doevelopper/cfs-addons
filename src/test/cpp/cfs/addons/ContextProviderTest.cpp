
#include <cfs/addons/ContextProviderTest.hpp>

using namespace cfs::addons;
using namespace cfs::addons::test;

ContextProviderTest::ContextProviderTest()
    : m_targetUnderTest()
{
    LOG4CXX_TRACE(logger, __LOG4CXX_FUNC__ );
}

ContextProviderTest::~ContextProviderTest()
{
    LOG4CXX_TRACE(logger, __LOG4CXX_FUNC__ );
}

void ContextProviderTest::SetUp()
{
    LOG4CXX_TRACE(logger, __LOG4CXX_FUNC__ );
    m_targetUnderTest = new Manager();
}

void ContextProviderTest::TearDown()
{
    LOG4CXX_TRACE(logger, __LOG4CXX_FUNC__ );
    delete m_targetUnderTest;
}

TEST_F(ContextProviderTest, test_Simple)
{
    LOG4CXX_TRACE(logger, __LOG4CXX_FUNC__);
}
