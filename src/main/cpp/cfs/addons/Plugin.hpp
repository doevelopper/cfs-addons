#ifndef CFS_ADDONS_PLUGIN_HPP
#define CFS_ADDONS_PLUGIN_HPP

#include <functional>

namespace cfs::addons
{
    /*! \class Plugin
    *
    * @brief Contains plugin's name, access token, and set of callbacks which
    *        are used to inform plugin about different events.
    */

    class Plugin
    {
    public:
        /*
         * @brief Function called after successful plugin initialization
         */
        template <typename T>
        std::function<void(T*)> onInitialization;
        /*!
         * @brief Function called on plugin shutdown caused by <...>
         */
        template <typename T>
        std::function<void(T*)> onShutdown;
        /*!
         * @brief Function called when new message is received
         */
        //template <typename T>
        //std::function<void(T*, ::Message)> onMessage;
        /*!
         * @brief Function that should restart plugin
         */
        template <typename T>
        std::function<void(T*)> onRestart;
        /*!
         * @brief Function that should reload plugin
         */
        template <typename T>
        std::function<void(T*)> onReload;

		Plugin();
		Plugin(const Plugin&) = default;
		Plugin(Plugin&&) = default;
		Plugin& operator=(const Plugin&) = default;
		Plugin& operator=(Plugin&&) = default;
		virtual ~Plugin();

    protected:

    private:
        std::string m_pluginName;
        std::string m_pluginAccessToken;
    };
}

#endif
