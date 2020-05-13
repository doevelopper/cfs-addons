
#ifndef CFS_ADDONS_MANAGER_HPP
#define CFS_ADDONS_MANAGER_HPP

namespace cfs::addons
{
	class Manager
	{
		//LOG4CXX_DECLARE_STATIC_LOGGER
	 public:
		Manager() = default;
		Manager(const Manager&) = default;
		Manager(Manager&&) = default;
		Manager& operator=(const Manager&) = default;
		Manager& operator=(Manager&&) = default;
		virtual ~Manager() = default;
	 protected:
	 private:
	};
}

#endif
