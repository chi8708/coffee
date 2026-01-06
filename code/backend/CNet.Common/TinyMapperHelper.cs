using Nelibur.ObjectMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CNet
{
    public static class TinyMapperHelper
    {
        public static TDestination TinyMapTo<TSource, TDestination>(this TSource source, bool isBind = true) where TSource : class, new()
        {
            if (isBind)
            {
                TinyMapper.Bind<TSource, TDestination>();
            }

            return TinyMapper.Map<TDestination>(source);
        }

        private static TDestination MapTo<TDestination>(this object source, bool isBind = true)
        {
            return TinyMapper.Map<TDestination>(source);
        }

        public static List<TDestination> MapToList<TSource, TDestination>(this IEnumerable<TSource> source, bool isBind = true) where
            TSource : class, new()
        {
            if (isBind)
            {
                TinyMapper.Bind<TSource, TDestination>();
            }
            List<TDestination> tResult = new List<TDestination>();

            foreach (var item in source)
            {
                tResult.Add(item.MapTo<TDestination>());
            }

            return tResult;
        }
    }
}
