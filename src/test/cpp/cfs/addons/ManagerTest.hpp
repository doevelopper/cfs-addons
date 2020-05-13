
#ifndef CFS_ADDONS_MANAGERTEST_HPP
#define CFS_ADDONS_MANAGERTEST_HPP

#include <gtest/gtest.h>
#include <cfs/addons/Manager.hpp>
namespace cfs::addons::test
{
    class ManagerTest : public ::testing::Test
    {
	   //LOG4CXX_DECLARE_STATIC_TEST_LOGGER
        public:

            ManagerTest();
            ManagerTest(const ManagerTest&) = delete;
            ManagerTest(ManagerTest&&) = delete;
            ManagerTest& operator=(const ManagerTest&) = delete;
            ManagerTest& operator=(ManagerTest&&) = delete;
            virtual ~ManagerTest();

            void SetUp() override;
            void TearDown() override;

        protected:
        private:
		    cfs::addons::Plugin * m_targetUnderTest;
    };
}

#endif
