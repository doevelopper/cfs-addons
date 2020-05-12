
#ifndef CFS_ADDONS_PLUGINTEST_HPP
#define CFS_ADDONS_PLUGINTEST_HPP

#include <gtest/gtest.h>
#include <cfs/addons/Plugin.hpp>
namespace cfs::addons::test
{
    class PluginTest : public ::testing::Test
    {
	   //LOG4CXX_DECLARE_STATIC_TEST_LOGGER
        public:

            PluginTest();
            PluginTest(const PluginTest&) = delete;
            PluginTest(PluginTest&&) = delete;
            PluginTest& operator=(const PluginTest&) = delete;
            PluginTest& operator=(PluginTest&&) = delete;
            virtual ~PluginTest();

            void SetUp() override;
            void TearDown() override;

        protected:
        private:
		    cfs::addons::Plugin * m_targetUnderTest;
    };
}

#endif
