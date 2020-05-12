
#include <cfs/addons/PluginTest.hpp>

using namespace cfs::addons;
using namespace cfs::addons::test;

log4cxx::LoggerPtr PluginTest::logger =
    log4cxx::Logger::getLogger(std::string("cfs.addons.test.PluginTest"));

PluginTest::PluginTest()
    : m_targetUnderTest()
{
    LOG4CXX_TRACE(logger, __LOG4CXX_FUNC__ );
}

PluginTest::~PluginTest()
{
    LOG4CXX_TRACE(logger, __LOG4CXX_FUNC__ );
}

void PluginTest::SetUp()
{
    LOG4CXX_TRACE(logger, __LOG4CXX_FUNC__ );
    m_targetUnderTest = new Plugin();
}

void PluginTest::TearDown()
{
    LOG4CXX_TRACE(logger, __LOG4CXX_FUNC__ );
    delete m_targetUnderTest;
}

TEST_F(PluginTest, test_Simple)
{
    LOG4CXX_TRACE(logger, __LOG4CXX_FUNC__);
}
