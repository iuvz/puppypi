
#ifndef SENSOR_ODOMETRY_EXPORT_H
#define SENSOR_ODOMETRY_EXPORT_H

#ifdef SENSOR_ODOMETRY_STATIC_DEFINE
#  define SENSOR_ODOMETRY_EXPORT
#  define SENSOR_ODOMETRY_NO_EXPORT
#else
#  ifndef SENSOR_ODOMETRY_EXPORT
#    ifdef sensor_odometry_EXPORTS
        /* We are building this library */
#      define SENSOR_ODOMETRY_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define SENSOR_ODOMETRY_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef SENSOR_ODOMETRY_NO_EXPORT
#    define SENSOR_ODOMETRY_NO_EXPORT __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef SENSOR_ODOMETRY_DEPRECATED
#  define SENSOR_ODOMETRY_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef SENSOR_ODOMETRY_DEPRECATED_EXPORT
#  define SENSOR_ODOMETRY_DEPRECATED_EXPORT SENSOR_ODOMETRY_EXPORT SENSOR_ODOMETRY_DEPRECATED
#endif

#ifndef SENSOR_ODOMETRY_DEPRECATED_NO_EXPORT
#  define SENSOR_ODOMETRY_DEPRECATED_NO_EXPORT SENSOR_ODOMETRY_NO_EXPORT SENSOR_ODOMETRY_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef SENSOR_ODOMETRY_NO_DEPRECATED
#    define SENSOR_ODOMETRY_NO_DEPRECATED
#  endif
#endif

#endif /* SENSOR_ODOMETRY_EXPORT_H */
