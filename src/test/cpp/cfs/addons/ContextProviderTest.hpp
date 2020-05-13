
#ifndef CFS_ADDONS_CONTEXTPROVIDERTEST_HPP
#define CFS_ADDONS_CONTEXTPROVIDERTEST_HPP

#include <gtest/gtest.h>
#include <cfs/addons/Manager.hpp>
namespace cfs::addons::test
{
    class ContextProviderTest : public ::testing::Test
    {
	   //LOG4CXX_DECLARE_STATIC_TEST_LOGGER
        public:

            ContextProviderTest();
            ContextProviderTest(const ContextProviderTest&) = delete;
            ContextProviderTest(ContextProviderTest&&) = delete;
            ContextProviderTest& operator=(const ContextProviderTest&) = delete;
            ContextProviderTest& operator=(ContextProviderTest&&) = delete;
            virtual ~ContextProviderTest();

            void SetUp() override;
            void TearDown() override;

        protected:
        private:
		    cfs::addons::Plugin * m_targetUnderTest;
    };
}

#endif
