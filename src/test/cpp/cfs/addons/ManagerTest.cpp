#include <cfs/addons/ManagerTest.hpp>

using namespace cfs::addons;
using namespace cfs::addons::test;

ManagerTest::ManagerTest()
    : m_targetUnderTest()
{
    LOG4CXX_TRACE(logger, __LOG4CXX_FUNC__ );
}

ManagerTest::~ManagerTest()
{
    LOG4CXX_TRACE(logger, __LOG4CXX_FUNC__ );
}

void ManagerTest::SetUp()
{
    LOG4CXX_TRACE(logger, __LOG4CXX_FUNC__ );
    m_targetUnderTest = new Manager();
}

void ManagerTest::TearDown()
{
    LOG4CXX_TRACE(logger, __LOG4CXX_FUNC__ );
    delete m_targetUnderTest;
}

TEST_F(ManagerTest, test_Simple)
{
    LOG4CXX_TRACE(logger, __LOG4CXX_FUNC__);
}
